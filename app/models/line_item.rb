class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

def total_price        # calculat total price for all items
product.price * quantity
end

end
