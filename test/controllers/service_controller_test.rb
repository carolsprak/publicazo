require 'test_helper'

class ServiceControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get listing" do
    get :listing
    assert_response :success
  end

  test "should get pricing" do
    get :pricing
    assert_response :success
  end

  test "should get description" do
    get :description
    assert_response :success
  end

  test "should get photo_upload" do
    get :photo_upload
    assert_response :success
  end

  test "should get amenities" do
    get :amenities
    assert_response :success
  end

  test "should get location" do
    get :location
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

end
