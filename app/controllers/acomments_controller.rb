class AcommentsController < ApplicationController
  def create
    hash = ActiveSupport::JSON.decode(params["acomment"])
    @article = Article.find(params["article_id"])
    @comment = @article.acomments.create(hash)
    respond_to do |format|
      if @comment
        format.html { redirect_to @article, notice: 'Comment was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
       format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
  def    destroy
    @article = Article.find(params[:article_id])
    @comment = @article.acomments.find(params[:id])
#    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @article, notice: 'Comment was successfully destroyed.' }
      format.json { render(json: {:redirection => article_path(@article), notice: 'Comment was successfully destroyed.'})}
  end
  end
end
