class SecretsController < ApplicationController
	def index
		@secrets = Secret.all
	end

	def create
		Secret.create(content:params[:secret], user:current_user)
		redirect_to '/users/%d' % current_user.id
	end

	def destroy
		Secret.find(params[:id]).destroy
		redirect_to :back
	end

end
