class UsersController < ApplicationController
  def new
  end

  def show
    @user = current_user
    puts '*'*20
    puts session[:user_id]
    puts @user.name
    puts '*'*20

  end

  def edit
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
