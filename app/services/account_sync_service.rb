require 'securerandom'
require 'digest'

class AccountSyncService

  def self.password_sync(user_details)
    account = Account.find(user_details[:id])
    salt = SecureRandom.hex(Setting.salt_length)
    password = Digest::SHA256.hexdigest(Setting.db_secret + user_details[:password] + salt)
    account.update(password: password, salt: salt)
  end

  def self.destroy(account_id)
    Account.find(account_id).destroy
  end

end
