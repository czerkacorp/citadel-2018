class AddSaltColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :citadel_users, :salt, :string
    add_column :citadel_users, :email_confirmed, :boolean, default: false
    add_column :citadel_users, :confirm_token, :string
  
    rename_table :settings, :citadel_settings
  end
end
