require 'securerandom'
require 'digest'

class UserFormService
  def self.filter(form_params)
    new(form_params).filter_relevant
  end

  def initialize(form_params)
    @form_params = form_params
    @user_params = Hash.new
  end

  def filter_relevant
    @user_params[:name] = @form_params[:name]
    @user_params[:email] = @form_params[:email]
    @user_params[:email_confirmed] = @form_params[:email_confirmed]
    if @form_params[:password] == "" then
      @form_params.delete(:password)
    else
      hash_password
    end
    return @user_params
  end

  def hash_password
    salt = SecureRandom.hex(12)
    db_secret = Secret[:db_secret]
    new_password = @user_params[:password]
    @user_params[:salt] = salt
    @user_params[:password] = Digest::SHA256.hexdigest(db_secret + new_password + salt)
    @form_params[:password] = @user_params[:password]
    @form_params[:salt] = @user_params[:salt]
  end
end

    