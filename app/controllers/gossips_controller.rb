class GossipsController < ApplicationController
  before_filter :after_token_authentication

  def after_token_authentication
    if params[:auth_token].present?
      @user = User.find_by_authentication_token(params[:auth_token]) # we are finding 

      if (@user == nil)
        respond_to do |format|
          format.html # index.html.erb
          format.json { render json: 'Wrong token' }
        end 
      end
    else
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: 'You need a token' }
      end
    end
  end

  # GET /gossips
  # GET /gossips.json
  def index
    @gossips = Gossip.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gossips }
    end
  end

  # GET /gossips/1
  # GET /gossips/1.json
  def show
    @gossip = Gossip.find(params[:id])
    array = []
    hash = {}
    @gossip.attribute_names.each {|var| hash[var] = @gossip.instance_variable_get("@attributes")[var] }
    @gossip.gcomments.each do |comment|
      user = User.find(comment.user_id)
      commentscore = []
      cvotes = Vote.find_all_by_score_id(comment.score.id)
      cvotes.each do |cvote|
        cuser = User.find(cvote.user_id)
        commentscore.append(cuser.login => cvote.value)
      end
      array.append({:id => comment.id,:user_login => user.login, :body => comment.body, :cvotes => commentscore })
    end
    likearray = []
    votes = Vote.find_all_by_score_id(@gossip.score.id)
    votes.each do |vote|
      user = User.find(vote.user_id)
      likearray.append(user.login => vote.value)
    end
    user = User.find(@gossip.user_id)
    res = { :gossip => hash, :comments => array, :login => user.login, :votes => likearray}
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: res }
    end
  end

  # GET /gossips/new
  # GET /gossips/new.json
  def new
    @gossip = Gossip.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gossip }
    end
  end

  # GET /gossips/1/edit
  def edit
    @gossip = Gossip.find(params[:id])
  end

  # POST /gossips
  # POST /gossips.json
  def create
   @user = User.find_by_authentication_token(params[:auth_token])
    @gossip = Gossip.new.from_json(params[:gossip])
    @gossip.user_id = @user.id
    respond_to do |format|
      if @gossip.save
        @gossip.score = Score.create(:score_pos => 0, :score_neg => 0)
        @gossip.save
        format.html { redirect_to @gossip, notice: 'Gossip was successfully created.' }
        format.json { render json: @gossip, status: :created, location: @gossip }
      else
        format.html { render action: "new" }
        format.json { render json: @gossip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gossips/1
  # PUT /gossips/1.json
  def update
    @gossip = Gossip.find(params[:id])

    respond_to do |format|
      if @gossip.update_attributes(params[:gossip])
        format.html { redirect_to @gossip, notice: 'Gossip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gossip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gossips/1
  # DELETE /gossips/1.json
  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy

    respond_to do |format|
      format.html { redirect_to gossips_url }
      format.json { head :no_content }
    end
  end
end
