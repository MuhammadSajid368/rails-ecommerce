class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def show
  end

  def index
    @products = Product.all

    if params[:filter]
      case params[:filter]
      when 'low_to_high'
        @products = @products.order(price: :asc)
      when 'high_to_low'
        @products = @products.order(price: :desc)
      end
    end

    if params[:search].present?
      @products = @products.where('name LIKE ?', "%#{params[:search]}%")
    end

    @products = @products.paginate(page: params[:page], per_page: 5)
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "Product created successfully!"
      redirect_to @product
    else
      render 'new'
    end
  end

  def update
    if @product.update(product_params)
      flash[:success] = "Product updated successfully!"
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    flash[:success] = "Product deleted successfully!"
    redirect_to products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end
end
