require 'spec_helper'

describe StoreController do
  render_views

  describe "GET 'index'" do
   
    it "should be successful" do
      get 'index'
      response.should be_success
    end

    it "should get index" do
      get 'index'
      assert_response :success
      assert_select '#side a', :minimun => 4
      assert_select '#main .entry', 1
      assert_select "h3", 'Pikatruths'
      assert_select '.price', /\$[,\d]+\.\d\d/
    end
  end
end
