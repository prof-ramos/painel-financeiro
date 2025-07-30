#!/bin/bash
# scripts/backup.sh

# Navegar para o diretório raiz do projeto
cd "$(dirname "$0")/.."

DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="scripts/backups/$DATE"

mkdir -p $BACKUP_DIR

# Backup do código
git bundle create $BACKUP_DIR/repo.bundle --all

# Backup das configurações
cp package.json next.config.mjs tsconfig.json $BACKUP_DIR/

# Backup do Vercel, se o comando existir
if command -v vercel &> /dev/null
then
    vercel env pull $BACKUP_DIR/.env.backup
else
    echo "Aviso: O comando 'vercel' não foi encontrado. Pulando o backup de ambiente do Vercel."
fi

# Compactar tudo
tar -czf scripts/painel-financeiro-backup-$DATE.tar.gz -C scripts/backups/$DATE .

echo "Backup completo salvo em: scripts/painel-financeiro-backup-$DATE.tar.gz"
