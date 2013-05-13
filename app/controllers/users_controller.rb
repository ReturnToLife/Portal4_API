class UsersController < ApplicationController
 
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    user = User.find(params[:id])
    votes = votes = Vote.find_all_by_user_id(user.id)
    scores = []
    votes.each {|vote| scores.append(Score.find(vote.score_id))}
    hash = {}
    hash["user"] = user
    hash["articles"] = Article.find_all_by_user_id(user.id)
    hash["acomments"] = Acomment.find_all_by_user_id(user.id)
    me = User.find_by_authentication_token(params[:auth_token])
    if user.id == me.id
      hash["isme"] = "true";
    else
      hash["isme"] = "false";
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: hash }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  
  def   pupdate
    tempfile = Tempfile.new(params[:filename])
    tempfile.write(params[:file])
    photo = ActionDispatch::Http::UploadedFile.new({:filename=>params[:filename], :type=>params[:content_type], :tempfile=>tempfile})
    @user = User.find(params[:id])
    @user.photo = photo
    @user.photo.save
    @user.save
    format.json { head :no_content }
    # respond_to do |format|
    #   if @user.update_attributes(params[:user])
    #     format.html { redirect_to @user, notice: 'User was successfully updated.' }
    #     format.json { head :no_content }
    #   else
    #     format.html { render action: "edit" }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
  end

end
