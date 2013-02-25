class CommentArticlesController < ApplicationController
  # GET /comment_articles
  # GET /comment_articles.json
  def index
    @comment_articles = CommentArticle.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comment_articles }
    end
  end

  # GET /comment_articles/1
  # GET /comment_articles/1.json
  def show
    @comment_article = CommentArticle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment_article }
    end
  end

  # GET /comment_articles/new
  # GET /comment_articles/new.json
  def new
    @comment_article = CommentArticle.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment_article }
    end
  end

  # GET /comment_articles/1/edit
  def edit
    @comment_article = CommentArticle.find(params[:id])
  end

  # POST /comment_articles
  # POST /comment_articles.json
  def create
    @comment_article = CommentArticle.new(params[:comment_article])

    respond_to do |format|
      if @comment_article.save
        format.html { redirect_to @comment_article, notice: 'Comment article was successfully created.' }
        format.json { render json: @comment_article, status: :created, location: @comment_article }
      else
        format.html { render action: "new" }
        format.json { render json: @comment_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comment_articles/1
  # PUT /comment_articles/1.json
  def update
    @comment_article = CommentArticle.find(params[:id])

    respond_to do |format|
      if @comment_article.update_attributes(params[:comment_article])
        format.html { redirect_to @comment_article, notice: 'Comment article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_articles/1
  # DELETE /comment_articles/1.json
  def destroy
    @comment_article = CommentArticle.find(params[:id])
    @comment_article.destroy

    respond_to do |format|
      format.html { redirect_to comment_articles_url }
      format.json { head :no_content }
    end
  end
end
