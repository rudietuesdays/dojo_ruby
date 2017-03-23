class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = ["User successfully created!"]
      redirect_to "/events"
    else
      flash[:notice] = @user.errors.full_messages
      redirect_to :back
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to "/events"
    else
      flash[:notice] = @user.errors.full_messages
      redirect_to :back
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
  end
end
