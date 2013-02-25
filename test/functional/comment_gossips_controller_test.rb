require 'test_helper'

class CommentGossipsControllerTest < ActionController::TestCase
  setup do
    @comment_gossip = comment_gossips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comment_gossips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comment_gossip" do
    assert_difference('CommentGossip.count') do
      post :create, comment_gossip: { content: @comment_gossip.content, gossip_id: @comment_gossip.gossip_id, score_id: @comment_gossip.score_id, user_id: @comment_gossip.user_id }
    end

    assert_redirected_to comment_gossip_path(assigns(:comment_gossip))
  end

  test "should show comment_gossip" do
    get :show, id: @comment_gossip
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comment_gossip
    assert_response :success
  end

  test "should update comment_gossip" do
    put :update, id: @comment_gossip, comment_gossip: { content: @comment_gossip.content, gossip_id: @comment_gossip.gossip_id, score_id: @comment_gossip.score_id, user_id: @comment_gossip.user_id }
    assert_redirected_to comment_gossip_path(assigns(:comment_gossip))
  end

  test "should destroy comment_gossip" do
    assert_difference('CommentGossip.count', -1) do
      delete :destroy, id: @comment_gossip
    end

    assert_redirected_to comment_gossips_path
  end
end
