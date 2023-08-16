class Api::V1::ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products, status: 200
  end

  def show
    product = Product.find_by(id: params[:id])
    if product
      render json: product, status: 200
    else
      render json: {error: "Not Found"}
    end
  end

  def create
    product = Product.new(product_params)
    if product.save
      render json: product, status: 200
    else
      render json: {error: "Product Not Created"} 
    end
  end


  private

  def product_params
    params.require(:products).permit(:name, :brand, :price)
  end
end
