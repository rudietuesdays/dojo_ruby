class LikesController < ApplicationController
  before_action :get_secret
  def like
    Like.create(secret: @secret, user: current_user)
    puts @secret.likes.count
    redirect_to :back
  end

  def unlike
    Like.find_by(secret: @secret, user: current_user).destroy
    redirect_to '/secrets'
  end

  private
    def get_secret
      @secret = Secret.find(params[:id])
    end
end
