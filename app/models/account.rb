require 'securerandom'
require 'digest'

class Account < ActiveRecord::Base
  attribute :admin_level, :integer, :limit => 1

  def self.register(user)
    salt = SecureRandom.hex(Setting.salt_length)
    account = Account.create!(
      username: user[:username],
      salt: salt,
      password: Digest::SHA256.hexdigest(Setting.db_secret + user[:password] + salt),
      active: false,
      station_id: Random.new.rand(4294967295))
    return account.account_id
  end
  
end
