require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get list_products" do
    get :list_products
    assert_response :success
  end

end
