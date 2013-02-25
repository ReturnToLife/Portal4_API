require 'test_helper'

class GossipsControllerTest < ActionController::TestCase
  setup do
    @gossip = gossips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gossips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gossip" do
    assert_difference('Gossip.count') do
      post :create, gossip: { score_id: @gossip.score_id, text: @gossip.text, user_id: @gossip.user_id }
    end

    assert_redirected_to gossip_path(assigns(:gossip))
  end

  test "should show gossip" do
    get :show, id: @gossip
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gossip
    assert_response :success
  end

  test "should update gossip" do
    put :update, id: @gossip, gossip: { score_id: @gossip.score_id, text: @gossip.text, user_id: @gossip.user_id }
    assert_redirected_to gossip_path(assigns(:gossip))
  end

  test "should destroy gossip" do
    assert_difference('Gossip.count', -1) do
      delete :destroy, id: @gossip
    end

    assert_redirected_to gossips_path
  end
end
