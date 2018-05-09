# frozen_string_literal: true
require 'byebug'

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # POST /resource
  def create
    super
    user = User.find_by(email: params[:user][:email])
    user.update(account_id: Account.register({username: params[:user][:username], password: params[:user][:password]}))
    user.save!
  end

  # PUT /resource
  def update
    account_id = @user.account_id
    super
    if params[:user][:password] != nil then
      AccountSyncService.password_sync(
        id: account_id, 
        password: params[:user][:password]
        )
    end
  end

  # DELETE /resource
  def destroy
    super
    account_id = @user.account_id
    AccountSyncService.destroy(account_id)
  end

  protected
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
