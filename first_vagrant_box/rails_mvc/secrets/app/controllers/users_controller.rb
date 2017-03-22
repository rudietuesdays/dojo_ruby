class UsersController < ApplicationController
	def index
	end
	def new
	end
	def create
		user = User.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
		if user.valid?
			flash[:notice] = ["User Created Successfully!"]
			redirect_to "/sessions/new"
		else
			flash[:notice] = user.errors.full_messages
			redirect_to "/"
		end
	end

	def show
		if current_user.id != params[:id].to_i
			redirect_to '/secrets'
		end
	  @user = current_user
	end

end
