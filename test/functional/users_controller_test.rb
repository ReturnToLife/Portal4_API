require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { avatar_url: @user.avatar_url, city: @user.city, email: @user.email, firstname: @user.firstname, lastname: @user.lastname, login: @user.login, photo_url: @user.photo_url, promo_id: @user.promo_id, report_url: @user.report_url, school_id: @user.school_id, uid: @user.uid }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: { avatar_url: @user.avatar_url, city: @user.city, email: @user.email, firstname: @user.firstname, lastname: @user.lastname, login: @user.login, photo_url: @user.photo_url, promo_id: @user.promo_id, report_url: @user.report_url, school_id: @user.school_id, uid: @user.uid }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
