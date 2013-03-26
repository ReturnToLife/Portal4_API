require 'test_helper'

class GcommentsControllerTest < ActionController::TestCase
  setup do
    @gcomment = gcomments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gcomments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gcomment" do
    assert_difference('Gcomment.count') do
      post :create, gcomment: { body: @gcomment.body, gossip_id: @gcomment.gossip_id, score_id: @gcomment.score_id, user_id: @gcomment.user_id }
    end

    assert_redirected_to gcomment_path(assigns(:gcomment))
  end

  test "should show gcomment" do
    get :show, id: @gcomment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gcomment
    assert_response :success
  end

  test "should update gcomment" do
    put :update, id: @gcomment, gcomment: { body: @gcomment.body, gossip_id: @gcomment.gossip_id, score_id: @gcomment.score_id, user_id: @gcomment.user_id }
    assert_redirected_to gcomment_path(assigns(:gcomment))
  end

  test "should destroy gcomment" do
    assert_difference('Gcomment.count', -1) do
      delete :destroy, id: @gcomment
    end

    assert_redirected_to gcomments_path
  end
end
