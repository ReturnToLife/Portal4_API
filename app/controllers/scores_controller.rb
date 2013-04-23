class ScoresController < ApplicationController

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

  # GET /scores
  # GET /scores.json
  def index
    @scores = Score.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @scores }
    end
  end

  def voteArticle
    @idArticle = params[:idArticle]
    @user = User.find_by_authentication_token(params[:auth_token])
    @article = Article.find_by_id(@idArticle)
    @score = @article.score
    if (@score != nil)
      @oldvote = Vote.find_by_user_id_and_score_id(@user.id, @score.id)
      if (@oldvote == nil)
        @newvote = Vote.new(:score_id => @score.id, :user_id => @user.id, :value => 1, :login => @user.login)
        @newvote.save
        @score.score_pos = @score.score_pos + 1
        @score.save
        respond_to do |format|
          format.html # index.html.erb
          format.json { render json: 'You have voted' }
        end
      else
        respond_to do |format|
          format.html # index.html.erb
          format.json { render json: 'You have already voted' }
        end
      end
    else
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: 'No score related' }
      end 
    end
  end

  def voteAcomment
    @idAcomment = params[:idAcomment]
    @user = User.find_by_authentication_token(params[:auth_token])
    @acomment = Acomment.find_by_id(@idAcomment)
    @score = @acomment.score
    if (@score != nil)
      @oldvote = Vote.find_by_user_id_and_score_id(@user.id, @score.id)
      if (@oldvote == nil)
        @newvote = Vote.new(:score_id => @score.id, :user_id => @user.id, :value => 1, :login => @user.login)
        @newvote.save
        @score.score_pos = @score.score_pos + 1
        @score.save
        respond_to do |format|
          format.html # index.html.erb
          format.json { render json: 'You have voted' }
        end
      else
        respond_to do |format|
          format.html # index.html.erb
          format.json { render json: 'You have already voted' }
        end
      end
    else
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: 'No score related' }
      end 
    end
  end
  
  def voteGossip
    @idGossip = params[:idGossip]
    @user = User.find_by_authentication_token(params[:auth_token])
    @gossip = Gossip.find_by_id(@idGossip)
    @score = @gossip.score
    @addvalue = 1
    if (@score != nil)
      @oldvote = Vote.find_by_user_id_and_score_id(@user.id, @score.id)
      if (@oldvote != nil)
        @newvote = @oldvote
        if (@newvote.value == -1) # ancien vote negatif
          @addvalue = 2
        end
        if (@newvote.value == 1) # ancien vote positif
          @addvalue = 0
        end
        @newvote.value = 1
      else
        @newvote = Vote.new(:score_id => @score.id, :user_id => @user.id, :value => 1, :login => @user.login)
      end
      @newvote.save
      @score.score_pos = @score.score_pos + @addvalue
      @score.save
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: 'You have voted' }
      end
    else
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: 'No score related' }
      end 
    end
  end

  def voteAgainstGossip
    @idGossip = params[:idGossip]
    @user = User.find_by_authentication_token(params[:auth_token])
    @gossip = Gossip.find_by_id(@idGossip)
    @score = @gossip.score
    @addvalue = -1
    
    if (@score != nil)
      @oldvote = Vote.find_by_user_id_and_score_id(@user.id, @score.id)
      if (@oldvote != nil)
        @newvote = @oldvote
        if (@newvote.value == -1) # ancien vote negatif
          @addvalue = 0
        end
        if (@newvote.value == 1) # ancien vote positif
          @addvalue = -2
        end
        @newvote.value = -1
      else
        @newvote = Vote.new(:score_id => @score.id, :user_id => @user.id, :value => -1, :login => @user.login)
      end
      @newvote.save
      @score.score_pos = @score.score_pos + @addvalue
      @score.save
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: 'You have voted' }
      end
    else
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: 'No score related' }
      end 
    end
  end

  def unvoteArticle
    @idArticle = params[:idArticle]
    @user = User.find_by_authentication_token(params[:auth_token])
    @score = Article.find(@idArticle).score
    if (@score != nil)
      @oldvote = Vote.find_by_user_id_and_score_id(@user.id, @score.id)
      if (@oldvote != nil)
        @oldvote.delete
        @score.score_pos = @score.score_pos - 1
        @score.save
        respond_to do |format|
          format.html # index.html.erb
          format.json { render json: 'You have unvoted' }
        end
      else
        respond_to do |format|
          format.html # index.html.erb
          format.json { render json: 'You didn\'t vote yet' }
        end
      end
    else
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: 'No score related' }
      end 
    end
  end

  def unvoteAcomment
    @idAcomment = params[:idAcomment]
    @user = User.find_by_authentication_token(params[:auth_token])
    @acomment = Acomment.find_by_id(@idAcomment)
    @score = @acomment.score
    if (@score != nil)
      @oldvote = Vote.find_by_user_id_and_score_id(@user.id, @score.id)
      if (@oldvote != nil)
        @oldvote.delete
        @score.score_pos = @score.score_pos - 1
        @score.save
        respond_to do |format|
          format.html # index.html.erb
          format.json { render json: 'You have unvoted' }
        end
      else
        respond_to do |format|
          format.html # index.html.erb
          format.json { render json: 'You didn\'t vote yet' }
        end
      end
    else
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: 'No score related' }
      end 
    end
  end
  def unvoteGossip
    @idGossip = params[:idGossip]
    @user = User.find_by_authentication_token(params[:auth_token])
    @score = Gossip.find(@idGossip).score
    if (@score != nil)
      @oldvote = Vote.find_by_user_id_and_score_id(@user.id, @score.id)
      if (@oldvote != nil)
        @oldvote.delete
        @score.score_pos = @score.score_pos - 1
        @score.save
        respond_to do |format|
          format.html # index.html.erb
          format.json { render json: 'You have unvoted' }
        end
      else
        respond_to do |format|
          format.html # index.html.erb
          format.json { render json: 'You didn\'t vote yet' }
        end
      end
    else
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: 'No score related' }
      end 
    end
  end
  
end

