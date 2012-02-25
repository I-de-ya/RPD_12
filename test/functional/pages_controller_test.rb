require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get materials" do
    get :materials
    assert_response :success
  end

  test "should get thesis_rules" do
    get :thesis_rules
    assert_response :success
  end

  test "should get contacts" do
    get :contacts
    assert_response :success
  end

  test "should get registration" do
    get :registration
    assert_response :success
  end

end
