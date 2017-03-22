class SessionsController < ApplicationController

	def new
	end

	def create

		if user = User.find_by(email: params[:email])


			user = user.authenticate(params[:password])



			if user
				session[:user_id] = user.id
				puts '\n\n\n'
		  	puts session[:user_id]
		  	puts '\n\n\n'
				redirect_to "/secrets"
			else
				flash[:notice] = ["incorrect password"]
				redirect_to "/sessions/new"
			end
		else
			flash[:notice] = ["incorrect email"]
			redirect_to "/sessions/new"
		end
	end

	def destroy
		reset_session
		redirect_to '/sessions/new'
	end

end
