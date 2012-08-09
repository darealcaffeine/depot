require 'spec_helper'     
describe Product do 
fixtures :products

  
  it "the truth" do
    assert true
  end


  it "attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end


  it "price must be positive" do
    product = Product.new(:title          => "My book",
                          :description    => "helloo",
                          :image_url      => "2343.jpg")
   
    product.price = -1 
    assert product.invalid?  
#    assert equal  "cannot be missing or have abcs dungface!",
    assert equal "must be greater or equal to 0.01"
   
   #  response.should have_selector("h2", :content => "cannot be missing or have abcs dungface!")
 
      product.errors[:price].join('; ')

    product.price = 0
    assert product.invalid? 
#    assert_equal "cannot be missing or have abcs dungface!",
      assert equal "must be greater or equal to 0.01" 
        product.errors[:price].join('; ')

    product.price = 1
    assert product.valid?
  end

  def new_product(image_url)
    Product.new(:title        =>  "Pokegames",
                :description  =>  "chasing yellow rats",
                :price        =>   10,
                :image_url    =>   image_url)
  end

  it "image url" do
   
    ok = %w{ pika.gif chu.jpg red.png OAK.JPG RIVAL.Jpg
            http://a.b.c/x/y/z/red.gif }
    bad = %w{ poop.doc poop.gif/purply poop.gif.yums }
    
    ok.each do |name|
      assert new_product(name).valid?, "#{name} shouldn't be invalid"
    end

    bad.each do |name|
      assert new_product(name).invalid?, "#{name} shouldn't be valid"
    end
  end

  it  "is not valid without a unique title" do
    product = Product.new(:title           => products(:ruby).title,
                          :description     => "huh?",
                          :price           => 6,
                          :image_url       => "fred.gif")
    assert !product.save
    assert_equal "has already been taken", product.errors[:title].join('; ')
  end
end
