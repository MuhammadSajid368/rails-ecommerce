class RatingsController < ApplicationController
  before_action :find_product

  def create
    @rating = @product.ratings.new(rating_params)
    @rating.user = current_user

    if @rating.save
      flash[:success] = 'Rating submitted successfully.'
    else
      flash[:danger] = 'Failed to submit rating.'
    end
    redirect_to @product
  end

  private

  def find_product
    @product = Product.find(params[:product_id])
  end

  def rating_params
    params.require(:rating).permit(:score) # Ensure this matches your form fields
  end
end
