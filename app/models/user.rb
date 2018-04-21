class User < ActiveRecord::Base
  self.table_name = "citadel_users"
  validates :name, uniqueness: true
  has_one :account

  def self.register(user)
    user[:salt] = SecureRandom.hex(12)
    user[:pass_hash] = Digest::SHA256.hexdigest(Setting['db_secret'] + user[:password] + salt)
    new_user = User.create(
      name: user[:name],
      password: user[:pass_hash],
      email: user[:email],
      salt: user[:salt],
      account_id: Account.register(user))
    return new_user
  end

  def self.update_details(id, params)
    user = User.find(id)
    user.update(UserFormService.filter(params))
    Account.update_sync(user[:account_id], params)
  end

  def get_account
    Account.find(account_id)
  end
end
