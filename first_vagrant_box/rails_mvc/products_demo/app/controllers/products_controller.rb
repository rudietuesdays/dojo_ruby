class ProductsController < ApplicationController
  def index
      @products = Product.all
    #   render json: @products # this looks like API data!
  end

  def new
  end

  def create
    # withour private method, commented part works... but with, for instance, coupon codes, use private method!
    #   @product = Product.create(name: params[:name], description: params[:description])
    #   puts @product
      redirect_to '/products/index'
      @product = Product.create( product_params )
      redirect_to '/products'
  end

  def update
    @product = Product.update( product_params )
    redirect_to '/products'
  end

  private
    def product_params
      params.require(:product).permit(:name, :description)
    end
  end
end
