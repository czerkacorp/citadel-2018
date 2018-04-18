# frozen_string_literal: true

require "securerandom"
require "digest"

# Users Controller
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    dbSecret = "swgemus3cr37!"
    salt = SecureRandom.hex(10)
    password = params[:new][:password]
    name = params[:new][:username]
    email = params[:new][:email]
    prng = Random.new
    station_id = prng.rand(4294967295)
    pass_hash = Digest::SHA256.hexdigest(dbSecret + password + salt)
    user = User.create(name: name, password: pass_hash, email: email)
    account = Account.create!(username: name, password: pass_hash, salt: salt, station_id: station_id)
    user.account_id = account.account_id
    user.save!
    redirect_to users_path
  end
end
