class UsersController < ApplicationController
  def new
  end

  def create
    if User.find_by(username: params[:username]) # user is found in db
      @user = User.find_by(username: params[:username])
      session[:id] = @user.id
    else #if user is not found
      @user = User.new(user_params)
      if @user.save
        flash[:notice] = ["User successfully created"]
        session[:id] = @user.id
        redirect_to messages_path
      else
        flash[:notice] = @user.errors.full_messages
        redirect_to :back
      end
    end
  end

  def logout
    reset_session
    redirect_to '/users/new'
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end
end
