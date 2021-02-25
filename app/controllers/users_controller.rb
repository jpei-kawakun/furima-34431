class UsersController < ApplicationController
  def index
    @user = User.find(params[:id])
  end

  def create
    @user = User.find(params[:id])
  end
