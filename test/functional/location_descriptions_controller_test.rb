require 'test_helper'

class LocationDescriptionsControllerTest < ActionController::TestCase
  setup do
    @location_description = location_descriptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:location_descriptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create location_description" do
    assert_difference('LocationDescription.count') do
      post :create, :location_description => @location_description.attributes
    end

    assert_redirected_to location_description_path(assigns(:location_description))
  end

  test "should show location_description" do
    get :show, :id => @location_description.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @location_description.to_param
    assert_response :success
  end

  test "should update location_description" do
    put :update, :id => @location_description.to_param, :location_description => @location_description.attributes
    assert_redirected_to location_description_path(assigns(:location_description))
  end

  test "should destroy location_description" do
    assert_difference('LocationDescription.count', -1) do
      delete :destroy, :id => @location_description.to_param
    end

    assert_redirected_to location_descriptions_path
  end
end
