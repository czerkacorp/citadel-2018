class CreateUsersTable < ActiveRecord::Migration[5.1]
  def change
    create_table :citadel_users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.references :account
    end
  end
end
