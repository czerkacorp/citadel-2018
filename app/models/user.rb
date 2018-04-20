require 'securerandom'
require 'digest'

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
    user = User.find(id: id)
    user.update(filter_params(params))
    Account.update_sync(user.account_id, params)
  end

  def filter_params(params)
    u_params = Hash.new
    u_params[:name] = params[:name]
    if params[:pass] != nil then
      u_params[:salt] = SecureRandom.hex(12)
      params[:salt] = u_params[:salt]
      u_params[:password] = Digest::SHA256.hexdigest(Setting['db_secret'] + params[:pass] + user_params[:salt])
      params[:password] = user_params[:password]
    end
    u_params[:email] = params[:email]
    return u_params
  end

  def get_account
    Account.find(account_id)
  end
end
