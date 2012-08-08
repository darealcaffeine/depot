require 'spec_helper'

describe Product do 
  
  it "the truth" do
    assert true
  end


  it "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end


  it "product price must be positive" do
    product = Product.new(:title          => "My book",
                          :description    => "helloo",
                          :image_url      => "2343.jpg")
   
    product.price = -1 
    assert product.invalid?  
#    assert equal  "cannot be missing or have abcs dungface!",
     assert equal "must be greater or equal to 0.01"
#    response.should have_selector("h2", :content => "cannot be missing or have abcs dungface!")
 
      product.errors[:price].join('; ')

    product.price = 0
    assert product.invalid? 
#    assert_equal "cannot be missing or have abcs dungface!",
      assert equal "must be greater or equal to 0.01" 
        product.errors[:price].join('; ')

    product.price = 1
    assert product.valid?
  end
end


