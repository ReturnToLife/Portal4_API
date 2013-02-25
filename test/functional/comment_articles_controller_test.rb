require 'test_helper'

class CommentArticlesControllerTest < ActionController::TestCase
  setup do
    @comment_article = comment_articles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comment_articles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comment_article" do
    assert_difference('CommentArticle.count') do
      post :create, comment_article: { article_id: @comment_article.article_id, content: @comment_article.content, score_id: @comment_article.score_id, user_id: @comment_article.user_id }
    end

    assert_redirected_to comment_article_path(assigns(:comment_article))
  end

  test "should show comment_article" do
    get :show, id: @comment_article
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comment_article
    assert_response :success
  end

  test "should update comment_article" do
    put :update, id: @comment_article, comment_article: { article_id: @comment_article.article_id, content: @comment_article.content, score_id: @comment_article.score_id, user_id: @comment_article.user_id }
    assert_redirected_to comment_article_path(assigns(:comment_article))
  end

  test "should destroy comment_article" do
    assert_difference('CommentArticle.count', -1) do
      delete :destroy, id: @comment_article
    end

    assert_redirected_to comment_articles_path
  end
end
