class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :set_cart
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!, if: :devise_controller?
  include SessionsHelper

  private

  # def set_cart
  #   if session[:cart_id]
  #     cart = Cart.find_by(id: session[:cart_id])
  #     cart.present? ? (@current_cart = cart) : (session[:cart_id] = nil)
  #   end

  #   if session[:cart_id].nil?
  #     @current_cart = Cart.create
  #     session[:cart_id] = @current_cart.id
  #   end
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
    # You can add more parameters if needed
  end
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless logged_in? && current_user.admin?
  end
end
