class CommentGossipsController < ApplicationController
  # GET /comment_gossips
  # GET /comment_gossips.json
  def index
    @comment_gossips = CommentGossip.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comment_gossips }
    end
  end

  # GET /comment_gossips/1
  # GET /comment_gossips/1.json
  def show
    @comment_gossip = CommentGossip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment_gossip }
    end
  end

  # GET /comment_gossips/new
  # GET /comment_gossips/new.json
  def new
    @comment_gossip = CommentGossip.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment_gossip }
    end
  end

  # GET /comment_gossips/1/edit
  def edit
    @comment_gossip = CommentGossip.find(params[:id])
  end

  # POST /comment_gossips
  # POST /comment_gossips.json
  def create
    @comment_gossip = CommentGossip.new(params[:comment_gossip])

    respond_to do |format|
      if @comment_gossip.save
        format.html { redirect_to @comment_gossip, notice: 'Comment gossip was successfully created.' }
        format.json { render json: @comment_gossip, status: :created, location: @comment_gossip }
      else
        format.html { render action: "new" }
        format.json { render json: @comment_gossip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comment_gossips/1
  # PUT /comment_gossips/1.json
  def update
    @comment_gossip = CommentGossip.find(params[:id])

    respond_to do |format|
      if @comment_gossip.update_attributes(params[:comment_gossip])
        format.html { redirect_to @comment_gossip, notice: 'Comment gossip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment_gossip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_gossips/1
  # DELETE /comment_gossips/1.json
  def destroy
    @comment_gossip = CommentGossip.find(params[:id])
    @comment_gossip.destroy

    respond_to do |format|
      format.html { redirect_to comment_gossips_url }
      format.json { head :no_content }
    end
  end
end
