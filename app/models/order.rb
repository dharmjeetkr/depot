class Order < ActiveRecord::Base
validates :name, :address, :email, presence: true
#validates :pay_type, inclusion: PAYMENT_TYPES

PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order","COD" ]


 has_many :line_items, dependent: :destroy  #this line must be add otherwise it give error undefined method line_items name error for crt contlr

def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
    item.cart_id = nil
    line_items << item
               
    end
end



end
