require 'test_helper'

class UserTechnologiesControllerTest < ActionController::TestCase
  setup do
    @user_technology = user_technologies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_technologies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_technology" do
    assert_difference('UserTechnology.count') do
      post :create, user_technology: { expertise: @user_technology.expertise, technology_id: @user_technology.technology_id, technology_type: @user_technology.technology_type, user_id: @user_technology.user_id }
    end

    assert_redirected_to user_technology_path(assigns(:user_technology))
  end

  test "should show user_technology" do
    get :show, id: @user_technology
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_technology
    assert_response :success
  end

  test "should update user_technology" do
    patch :update, id: @user_technology, user_technology: { expertise: @user_technology.expertise, technology_id: @user_technology.technology_id, technology_type: @user_technology.technology_type, user_id: @user_technology.user_id }
    assert_redirected_to user_technology_path(assigns(:user_technology))
  end

  test "should destroy user_technology" do
    assert_difference('UserTechnology.count', -1) do
      delete :destroy, id: @user_technology
    end

    assert_redirected_to user_technologies_path
  end
end
