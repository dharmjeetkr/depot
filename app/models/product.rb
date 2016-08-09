#The model layer is the gatekeeper between the world of code and the database This makes models an ideal place to put validations code  
# If a model checks it before writing to the database, then the database will be protected from bad data


class Product < ActiveRecord::Base

validates :name, :description, :image_url, presence: true  #validates is used to check  the name field of model against its condn 
				                # presence: true tells the validator to check that each of the named fields is present
                                                # and its contents should  not be empty


validates :price, numericality: {greater_than_or_equal_to: 0.01} #price condn is that it should be >=0.01

validates :name, uniqueness: true                                #it check for all name should be unique this is condn for name

validates :image_url, allow_blank: true, format: {
with: %r{\.(gif|jpg|png)\Z}i,		#this condn is for image url and its check that the URL ends with one of .gif , .jpg ,or .png
	message: 'must be a URL for GIF, JPG or PNG image.'
}



def self.latest
Product.order(:updated_at).last
end

has_many :line_items
before_destroy :ensure_not_referenced_by_any_line_item

private
# ensure that there are no line items referencing this product
def ensure_not_referenced_by_any_line_item
	if line_items.empty?
	   return true         #true means it destroy the row from database
       else
		errors.add(:base, 'Line Items present')
	   return false            # here the row will not be destroyed.
	end
     end
 

end



