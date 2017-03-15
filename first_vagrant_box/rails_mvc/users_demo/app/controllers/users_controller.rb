class UsersController < ApplicationController
  def index
      @users = User.all
      render json: @users
  end

  def new
  end

  def create
      User.create(name: params[:name])
      redirect_to "/users"
  end

  def show
      @user = User.find(params[:id])
      render json: @user
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
      User.find(params[:id]).update(name: params[:name])
      redirect_to "/users"
  end

  def total
      render text: User.count
  end
end
