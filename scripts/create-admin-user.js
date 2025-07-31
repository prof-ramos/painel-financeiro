import { createClient } from '@supabase/supabase-js';

// Supabase configuration
const supabaseUrl = 'https://mdqklildcwvsltvmgbgu.supabase.co';
const supabaseServiceKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1kcWtsaWxkY3d2c2x0dm1nYmd1Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc1MzgyMTA3NywiZXhwIjoyMDY5Mzk3MDc3fQ.A7PzW51WIjYreyJ-q2rxsKGII6mRHs-pr32GR_1E1m4';

const supabase = createClient(supabaseUrl, supabaseServiceKey);

async function createAdminUser() {
  try {
    console.log('🔄 Creating admin user...');

    // Create admin user using Supabase Auth Admin API
    const { data, error } = await supabase.auth.admin.createUser({
      email: 'admin@example.com',
      password: 'admin123!',
      email_confirm: true,
      user_metadata: {
        username: 'admin',
        role: 'admin'
      }
    });

    if (error) {
      console.error('❌ Error creating admin user:', error.message);

      // Try to update existing user password
      console.log('🔄 Trying to update existing user password...');

      const { data: users, error: listError } = await supabase.auth.admin.listUsers();

      if (listError) {
        console.error('❌ Error listing users:', listError.message);
        return;
      }

      const adminUser = users.users.find(user =>
        user.email === 'admin@example.com' ||
        user.user_metadata?.username === 'admin'
      );

      if (adminUser) {
        console.log('✅ Found existing admin user, updating password...');

        const { data: updateData, error: updateError } = await supabase.auth.admin.updateUserById(
          adminUser.id,
          { password: 'admin123!' }
        );

        if (updateError) {
          console.error('❌ Error updating password:', updateError.message);
          return;
        }

        console.log('✅ Password updated successfully');
      } else {
        console.log('❌ No admin user found');
        return;
      }
    } else {
      console.log('✅ Admin user created successfully');
    }

    console.log('📝 Admin credentials:');
    console.log('   Email: admin@example.com');
    console.log('   Password: admin123!');
    console.log('   Username: admin');

  } catch (error) {
    console.error('❌ Unexpected error:', error.message);
  }
}

// Run the script
createAdminUser(); 