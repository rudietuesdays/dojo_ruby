class SecretsController < ApplicationController
  def index
    @secrets = Secret.all
    @user = current_user
  end

  def create
    @secret = Secret.new(content: params[:content], user: current_user)
    if @secret.save
      flash[:notice] = ["Your secret is safe with me!"]
      redirect_to :back
    else
      flash[:notice] = @secret.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    @user = current_user
    @secret = Secret.find(params[:id])
    if @secret.user.id == @user.id 
      @secret.destroy
      redirect_to "/users/#{@user.id}"
    else
      flash[:notice] = @secret.errors.full_messages
      redirect_to :back
    end
  end

  # private
  #   def secret_params
  #     params.require(:secret).permit(:content).merge(user: current_user)
  #   end
end
