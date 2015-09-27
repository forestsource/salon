require 'test_helper'

class Admin::ShiftsControllerTest < ActionController::TestCase
  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
