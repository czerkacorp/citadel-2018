# frozen_string_literal: true

require 'securerandom'
require 'digest'

# Users Controller
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    ## SWGEmu Default dbSecret
    ## To be reworked at a later date
    prng = Random.new
    db_secret = 'swgemus3cr37!'
    salt = SecureRandom.hex(10)
    password = params[:new_user][:password]
    username = params[:new_user][:username]
    pass_hash = Digest::SHA256.hexdigest(db_secret + password + salt)
    begin
      User.create!(username: username,
                   password: pass_hash,
                   station_id: prng.rand(4294967295),
                   salt: salt)
      redirect_to users_path
    rescue ActiveRecord::RecordInvalid
      flash.now[:error] = 'Error Saving User'
    end
  end
end
