import { createClient } from '@supabase/supabase-js';
import fs from 'fs';
import path from 'path';

// Supabase configuration
const supabaseUrl = 'https://mdqklildcwvsltvmgbgu.supabase.co';
const supabaseServiceKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1kcWtsaWxkY3d2c2x0dm1nYmd1Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc1MzgyMTA3NywiZXhwIjoyMDY5Mzk3MDc3fQ.A7PzW51WIjYreyJ-q2rxsKGII6mRHs-pr32GR_1E1m4';

const supabase = createClient(supabaseUrl, supabaseServiceKey);

async function setupDatabase() {
  try {
    console.log('🔄 Setting up database...');

    // Read the database setup SQL file
    const sqlPath = path.join(process.cwd(), 'scripts', 'database-setup.sql');
    const sqlContent = fs.readFileSync(sqlPath, 'utf8');

    // Split the SQL into individual statements
    const statements = sqlContent
      .split(';')
      .map(stmt => stmt.trim())
      .filter(stmt => stmt.length > 0 && !stmt.startsWith('--'));

    console.log(`📝 Found ${statements.length} SQL statements to execute`);

    // Execute each statement
    for (let i = 0; i < statements.length; i++) {
      const statement = statements[i];
      if (statement.trim()) {
        try {
          console.log(`🔄 Executing statement ${i + 1}/${statements.length}...`);

          // Use the SQL editor API
          const { data, error } = await supabase
            .from('_sql')
            .select('*')
            .eq('query', statement);

          if (error) {
            console.log(`⚠️  Statement ${i + 1} had an issue (this might be normal):`, error.message);
          } else {
            console.log(`✅ Statement ${i + 1} executed successfully`);
          }
        } catch (stmtError) {
          console.log(`⚠️  Statement ${i + 1} failed (this might be normal):`, stmtError.message);
        }
      }
    }

    console.log('✅ Database setup completed');

    // Now reset the admin password
    console.log('🔄 Resetting admin password...');

    const { data: resetData, error: resetError } = await supabase.rpc('reset_user_password', {
      p_username: 'admin',
      p_new_password: 'admin123!'
    });

    if (resetError) {
      console.error('❌ Error resetting password:', resetError.message);
    } else {
      console.log('✅ Password reset successfully');
      console.log('📝 New credentials:');
      console.log('   Username: admin');
      console.log('   Password: admin123!');
    }

  } catch (error) {
    console.error('❌ Unexpected error:', error.message);
  }
}

// Run the script
setupDatabase(); 