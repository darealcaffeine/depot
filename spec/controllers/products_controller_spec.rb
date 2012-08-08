require 'spec_helper'

describe ProductsController do
  render_views
 
  before(:each) do

    @product = Product.new
    @update= Factory(:product)
    @attr = {
      :title         => 'pickachus',
      :description   => 'warm and yellow',
      :image_url     => 'pikachu.jpg',
      :price         =>  '3.99' }
  end

  it "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  it "should get new" do
    get :new
    assert_response :success
  end

#  it "should create product" do
#    post :create, :product => @update
#      assert_difference('Product.count') do
#      end

#    response.should redirect_to(product_path(assigns(:product)))
#  end


  it "should really create a product" do
    expect {
      post :create, :product => @attr
    }.to change { Product.count}.by(1)
    response.should redirect_to(product_path(assigns(:product)))
  end

  it "should  create a product" do
        lambda do
          post :create, :product => @attr
        end.should change(Product, :count).by(1)
  end

  it "should redirect to the product page" do
        post :create, :product => @attr
        response.should redirect_to(product_path(assigns(:product)))
  end
  

  it "should show product" do
    get :show, :id => @update
    assert_response :success
  end

  it "should get edit" do
    get :edit, :id => @update
    assert_response :success
  end

  it "should update product" do
    put :update, :id => @update, :product => @attr
    response.should redirect_to(product_path(assigns(:products)))
  end
  
 # test "should destroy product" do
  #  assert_difference('Product.count', -1) do
   #   delete :destroy, :id => @product.to_param
   # end

   # assert_redirected_to products_path
 # end

  it "should  destroy a product" do
        lambda do
          delete :destroy, :id => @update
        end.should change(Product, :count).by(-1)
  end
end  
