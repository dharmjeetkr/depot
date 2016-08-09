require 'test_helper'
class ProductTest < ActiveSupport::TestCase
# test "the truth" do
#assert true
# end

fixtures :products

test "product is not valid without a unique name" do
	product = Product.new(name: products(:ruby1).name, description: "yyy", price: 1, image_url: "fred.gif")
	assert product.invalid?
	assert_equal ["has already been taken"], product.errors[:name]
end

test "product attributes must not be empty" do
product = Product.new
assert product.invalid?
assert product.errors[:name].any?
assert product.errors[:description].any?
assert product.errors[:price].any?
assert product.errors[:image_url].any?
end

test "product price must be positive" do
product = Product.new(name: "My Book Title", description: "yyy", image_url: "zzz.jpg")
product.price = -1
assert product.invalid?
assert_equal ["must be greater than or equal to 0.01"],
product.errors[:price]
product.price = 0
assert product.invalid?
assert_equal ["must be greater than or equal to 0.01"],
product.errors[:price]
product.price = 1
assert product.valid?
end


end
