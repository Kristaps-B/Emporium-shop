class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    
    
    
  protect_from_forgery with: :exception
    
     private
    def initialize_cart
    if session[:cart_id] and Cart.exists?(session[:cart_id])
    @cart = Cart.find(session[:cart_id])
    else
    @cart = Cart.create
    session[:cart_id] = @cart.id
    end
    end  
    
    helper_method :current_user
    
    def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
end
end
