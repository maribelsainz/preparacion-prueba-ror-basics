class ProductsController < ApplicationController
  def index
  @products = Product.order(:id)
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    if product.save
      redirect_to root_path, notice: 'El product fue ingresado con éxito!'
    else
      redirect_to root_path, alert: 'Error al ingresar nuevo product. Intente nuevamente...!'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_path, notice: 'El product fue eliminado con éxito!'
  end
  private
    def product_params #Por convención el método de Strong params es el nombre del recurso + guión bajo + params
      params.require(:product).permit(:name, :price, :description)
    end


end

