class CartItem < ActiveRecord::Base
    belongs_to :cart
    belongs_to :book
    attr_protected
    
end
