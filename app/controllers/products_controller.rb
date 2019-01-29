class ProductsController < ApplicationController
    
    def index
        @products = Product.all
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.create(product_params)
        @product.save
        redirect_to products_path
    end
    
    def description
        product = Product.find(params[:id])
        render plain: product.description
    end

    def inventory
        product = Product.find(params[:id])
        if product.inventory > 0
            render plain: "true"
        else
            render plain: "false"
        end
    end

    private
  # Use callbacks to share common setup or constraints between actions.
    def set_product
    @post = Product.find(params[:id])
    end

    def product_params
    params.require(:product).permit(:name, :description, :inventory, :price)
    end

end
