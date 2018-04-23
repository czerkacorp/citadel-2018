# frozen_string_literal: true

require 'securerandom'
require 'digest'

# Users Controller
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @user = User.register(params[:new])
    redirect_to users_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    User.update_details(params[:id], params[:user])
    redirect_to users_path
  end  

  def show
    @user = User.find(params[:id])
  end
end
