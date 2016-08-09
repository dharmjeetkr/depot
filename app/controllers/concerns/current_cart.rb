module CurrentCart
extend ActiveSupport::Concern
private
def set_cart
@cart = Cart.find(session[:cart_id])  # The set_cart() method starts by getting the :cart_id from the session object and
					#then attempts to find a cart corresponding to this ID 
rescue ActiveRecord::RecordNotFound
@cart = Cart.create                #create a new cart 
session[:cart_id] = @cart.id      #Save the id of newly created Cart in session 
end
end
