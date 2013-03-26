class GcommentsController < ApplicationController
  before_filter :authenticate_user!, :if => Proc.new { |c| c.request.format == 'application/json' }

  def create
    @user = User.find_by_authentication_token(params[:auth_token])

    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.gcomments.create({:user_id => @user.id, :body => params[:body]})

    respond_to do |format|
      if @comment
        @comment.score = Score.create(:score_pos => 0, :score_neg => 0)
        @comment.save
        format.html { redirect_to @gossip, notice: 'Comment was successfully created.' }
        format.json { render json: @gossip, status: :created, location: @gossip }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def   pdestroy
    @user = User.find_by_authentication_token(params[:auth_token])
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.gcomments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @gossip, notice: 'Comment was successfully destroyed.' }
      format.json { render(json: gossip_path(@gossip))}
    end
  end
end
