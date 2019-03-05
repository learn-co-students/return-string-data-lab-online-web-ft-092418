class ProductsController < ApplicationController
   
  
    def index
      @products = Product.all
    end
  
    def inventory
      product = Product.find(params[:id])
      render plain: product.inventory > 0 ? true : false
    end

    def description
      product = Product.find(params[:id])
      render plain: product.description
    end
  
    def new
      @product = Product.new
    end
  
    def edit
    end
  
    def create
      @product = Product.new(product_params)
      if @product.save
        flash[:success] = "Product successfully created"
        redirect_to products_path
      else
        flash[:error] = "Something went wrong"
        render 'new'
      end
    end
  
    def update
      if @product.update_attributes(params[product_params])
        flash[:success] = "Product was successfully updated"
        redirect_to @product
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
    end
  
    def destroy
      if @product.destroy
        flash[:success] = "Product was successfully deleted"
        redirect_to @products_path
      else
        flash[:error] = "Something went wrong"
        redirect_to @products_path
      end
    end
  
    private
    
    def product_params
      params.require(:product).permit(:name, :description, :inventory, :price)
    end
  
end

