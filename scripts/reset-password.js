import { createClient } from '@supabase/supabase-js';

// Supabase configuration
const supabaseUrl = 'https://mdqklildcwvsltvmgbgu.supabase.co';
const supabaseServiceKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1kcWtsaWxkY3d2c2x0dm1nYmd1Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc1MzgyMTA3NywiZXhwIjoyMDY5Mzk3MDc3fQ.A7PzW51WIjYreyJ-q2rxsKGII6mRHs-pr32GR_1E1m4';

const supabase = createClient(supabaseUrl, supabaseServiceKey);

async function resetAdminPassword() {
  try {
    console.log('🔄 Resetting admin password...');

    // New password
    const newPassword = 'admin123!';

    // Try to call the reset_user_password function
    const { data, error } = await supabase.rpc('reset_user_password', {
      p_username: 'admin',
      p_new_password: newPassword
    });

    if (error) {
      console.error('❌ Error calling reset_user_password function:', error.message);

      // Try to create the function first
      console.log('🔄 Creating reset_user_password function...');

      const createFunctionSQL = `
        CREATE OR REPLACE FUNCTION reset_user_password(
          p_username VARCHAR,
          p_new_password VARCHAR
        ) RETURNS VOID AS $$
        BEGIN
          UPDATE users
          SET password_hash = crypt(p_new_password, gen_salt('bf')),
              updated_at = NOW()
          WHERE username = p_username;

          IF NOT FOUND THEN
            RAISE EXCEPTION 'User % not found', p_username;
          END IF;
        END;
        $$ LANGUAGE plpgsql;
      `;

      const { error: createError } = await supabase.rpc('exec_sql', {
        sql: createFunctionSQL
      });

      if (createError) {
        console.error('❌ Error creating function:', createError.message);
        console.log('⚠️  Please run the database-setup.sql script first');
        return;
      }

      // Try again
      const { data: retryData, error: retryError } = await supabase.rpc('reset_user_password', {
        p_username: 'admin',
        p_new_password: newPassword
      });

      if (retryError) {
        console.error('❌ Error on retry:', retryError.message);
        return;
      }
    }

    console.log('✅ Password reset successfully');
    console.log('📝 New credentials:');
    console.log('   Username: admin');
    console.log('   Password: admin123!');

  } catch (error) {
    console.error('❌ Unexpected error:', error.message);
  }
}

// Run the script
resetAdminPassword(); 