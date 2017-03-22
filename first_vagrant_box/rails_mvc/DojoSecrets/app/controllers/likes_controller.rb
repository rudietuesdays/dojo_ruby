class LikesController < ApplicationController  
  def create
    @like = Like.new(user: current_user, secret_id: params[:id])
    @like.save
    redirect_to :back
  end

  def destroy
    secret = Secret.find(params[:id])
    @like = Like.find_by(secret: secret, user: current_user)
    @like.destroy if current_user === @like.user
    redirect_to :back
  end

  # private
  #   def like_params
  #     params.require(:like).permit(:secret_id).merge(user: current_user)
  #   end
end
