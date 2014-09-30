class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin! ,only: [:new, :edit, :update, :destroy,:import]
  
  def index
  @products = Product.all
  @products = Product.order(:name)
  respond_to do |format|
    format.html
    format.csv { send_data @products.to_csv }
    format.xls
  end
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
    end
  end

  ##import file
  def import
    Product.import(params[:file])
    redirect_to root_url, notice: "Products imported."
  end

  private
  ##callbacks
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :category, :discription, :quantity)
  end
end
