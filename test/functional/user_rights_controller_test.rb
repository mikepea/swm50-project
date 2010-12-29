require 'test_helper'

class UserRightsControllerTest < ActionController::TestCase
  setup do
    @user_right = user_rights(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_rights)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_right" do
    assert_difference('UserRight.count') do
      post :create, :user_right => @user_right.attributes
    end

    assert_redirected_to user_right_path(assigns(:user_right))
  end

  test "should show user_right" do
    get :show, :id => @user_right.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @user_right.to_param
    assert_response :success
  end

  test "should update user_right" do
    put :update, :id => @user_right.to_param, :user_right => @user_right.attributes
    assert_redirected_to user_right_path(assigns(:user_right))
  end

  test "should destroy user_right" do
    assert_difference('UserRight.count', -1) do
      delete :destroy, :id => @user_right.to_param
    end

    assert_redirected_to user_rights_path
  end
end
