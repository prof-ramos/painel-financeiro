#!/bin/bash
# scripts/backup.sh
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="backups/$DATE"

mkdir -p $BACKUP_DIR

# Backup do código
git bundle create $BACKUP_DIR/repo.bundle --all

# Backup das configurações
cp package.json next.config.mjs tsconfig.json $BACKUP_DIR/

# Backup do Vercel
vercel env pull $BACKUP_DIR/.env.backup

# Compactar tudo
tar -czf painel-financeiro-backup-$DATE.tar.gz $BACKUP_DIR/

echo "Backup completo salvo em: painel-financeiro-backup-$DATE.tar.gz"
