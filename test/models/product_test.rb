require 'test_helper'
class ProductTest < ActiveSupport::TestCase
# test "the truth" do
#assert true
# end

test "product attributes must not be empty" do
product = Product.new
assert product.invalid?
assert product.errors[:name].any?
assert product.errors[:description].any?
assert product.errors[:price].any?
assert product.errors[:image_url].any?
end

test "product price must be positive" do
product = Product.new(name: "My Book Title", description: "yyy", "zzz.jpg")
image_url: product.price = -1
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

def new_product(image_url)
"My Book name",
Product.new(name: description: "yyy",price: 1,image_url: image_url)

end
test "image url" do
ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
http://a.b.c/x/y/z/fred.gif }
bad = %w{ fred.doc fred.gif/more fred.gif.more }
ok.each do |name|
assert new_product(name).valid?, "#{name} should be valid"
end
bad.each do |name|
assert new_product(name).invalid?, "#{name} shouldn't be valid"
end

end

end
