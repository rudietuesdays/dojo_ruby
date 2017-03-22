class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :this_user, except: [:new, :create]

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = ["User successfully created! Please login below:"]
      redirect_to "/sessions/new"
    else
      flash[:notice] = @user.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @user = current_user
    @secrets =  Secret.all
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to "/users/#{@user.id}"
    else
      flash[:notice] = @user.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    @user = current_user
    if @user.destroy
      reset_session
      redirect_to '/users/new'
    else
      redirect_to "/users/#{@user.id}"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  def this_user
    redirect_to "/users/#{current_user.id}" unless params[:id].to_i == session[:user_id]
  end
end
