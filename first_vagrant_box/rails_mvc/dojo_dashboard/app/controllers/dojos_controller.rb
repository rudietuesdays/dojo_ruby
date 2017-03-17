class DojosController < ApplicationController
  # before_action :set_dojo, only: [:show, :edit, :update, :destroy]

  def index
    @dojos = Dojo.all
  end

  def new
    @dojo = Dojo.new
  end

  def create
    @dojo = Dojo.new(branch: params[:branch], street: params[:street], city: params[:city], state: params[:state])

      if @dojo.save
        redirect_to '/dojos'
      else
        render :new
      end
  end

  def show
    @dojo = Dojo.find(params[:id])
  end

  def edit
    @dojo = Dojo.find(params[:id])
  end

  def update
    @dojo = Dojo.find(params[:id])
    if @dojo.update(branch: params[:branch], street: params[:street], city: params[:city], state: params[:state])
      redirect_to @dojo
    else
      render :edit
    end
  end

  def destroy
    @dojo = Dojo.find(params[:id])
    @dojo.destroy
    redirect_to '/dojos'
  end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_dojo
  #     @dojo = Dojo.find(params[:id])
  #   end
  #
  #   # Never trust parameters from the scary internet, only allow the white list through.
  #   def dojo_params
  #     params.require(:dojo).permit(:branch, :street, :city, :state)
  #   end
end
