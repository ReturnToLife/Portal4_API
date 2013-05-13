class GroupsController < ApplicationController
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

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.find(params[:id])
    us = User.find_by_authentication_token(params[:auth_token])
    hash = {}
    @group.attribute_names.each {|var| hash[var] = @group.instance_variable_get("@attributes")[var] }
    members = {}
    articles = Article.find_all_by_group_id(@group.id)

    members = Job.find_all_by_group_id(@group.id)
    members_info = []
    is_admin = "false"
    is_member = "false"
    members.each do |member|
      user = User.find(member.user_id)
      if (user.id == us.id)
        is_member = "true"
      end
      if (user.id == us.id && member.job == "admin")
        puts "is admin"
        is_admin = "true"
      end
      members_info.append(user.login => member.job)
    end
    res = { :group => hash, :members => members, :members_info => members_info , :articles => articles, :is_admin => is_admin, :is_member => is_member}
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: res }
    end
  end

  def savemember
    puts "Everybody here?"
    user = User.find_by_login(params[:login])
    if (user != nil)
      puts "lets start!"
      job = Job.new(:user_id => user.id, :group_id => params[:group_id],  :job => params[:job])
      puts "lets save!"
      job.save
      puts "my job is over here!"
    else
      
    end
    respond_to do |format|
      format.html # savemember.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/new
  # GET /groups/new.json
  def new
    @group = Group.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end

  # POST /groups
  # POST /groups.json
  def create
    @user = User.find_by_authentication_token(params[:auth_token])
    @group = Group.new.from_json(params[:group])
    respond_to do |format|
      if @group.save
        job = Job.create(:user_id => @user.id, :group_id => @group.id, :job => "admin")
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render json: @group, status: :created, location: @group }
      else
        format.html { render action: "new" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.json
  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end
end
