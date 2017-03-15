class UsersController < ApplicationController
  def index
    # @users = User.all
    # render json: @users
    session[:count] ||= 0
  end

  def new
    # @user = User.new
  end

  def create
    # @user = User.create(user_params)

    # Save the post data (params[:survey]) to session
    session[:result] = params[:user]

    # Increment the session views upon submission of the form
    session[:count] += 1

    # Save success message to flash to show it once
    flash[:success] = "You have submitted the form #{session[:count]} times"

    # To prevent submission of form with page reload
    redirect_to '/users/result'

    # respond_to do |format|
    #   if @user.save
    #     format.html { redirect_to @user, notice: 'User was successfully created.' }
    #     format.json { render action: 'show', status: :created, location: @user }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def show
    # @user = User.find(params[:id])

    # Save the data to variable accessible in the views
    @user = session[:result]
    puts @user
  end

  # private
  # def user_params
  #   params.require(:user).permit(:name, :location, :language, :comment)
  # end

end
