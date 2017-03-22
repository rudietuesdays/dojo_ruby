class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    # render login page
    puts '*'*20
    puts session[:user_id]
  end

  def create
    # login user
    @user = User.find_by(email: params[:email])
    # if authenticate is true
    if @user and @user.authenticate(params[:password])
      # save uid to session
      session[:user_id] = @user.id
      # redirect to user's profile page
      redirect_to "/users/#{@user.id}"
    # if auth is false
    else
      # add error message
      flash[:notice] = ["Invalid email or password"]
      # redirect to login page
      redirect_to :back
    end

  end

  def destroy
    # logout user
    # set session uid to null
    reset_session
    # redirect to login page
    redirect_to '/sessions/new'
  end

end
