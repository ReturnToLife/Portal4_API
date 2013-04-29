class RessourcesController < ApplicationController
  # GET /ressources
  # GET /ressources.json
  def index
    if (params[:group_id])
      @ressources = Ressource.find_all_by_group_id(params[:group_id])
    else
      @ressources = Ressource.all
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ressources }
    end
  end

  # GET /ressources/1
  # GET /ressources/1.json
  def show
    @ressource = Ressource.find(params[:id])
    array = []
    hash = {}
    @ressource.attribute_names.each {|var| hash[var] = @ressource.instance_variable_get("@attributes")[var] }
    user = User.find(@ressource.user_id)
    res = {:ressource => hash, :login => user.login}
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: res }
    end
  end

  # GET /ressources/new
  # GET /ressources/new.json
  def new
    @ressource = Ressource.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ressource }
    end
  end

  # GET /ressources/1/edit
  def edit
    @ressource = Ressource.find(params[:id])
  end

  # POST /ressources
  # POST /ressources.json
  def create
    @user = User.find_by_authentication_token(params[:auth_token])
    @ressource = Ressource.new.from_json(params[:ressource])
    @ressource.group_id = params[:group_id]
    @ressource.user_id = @user.id
    old = Ressource.find_by_name_and_group_id(@ressource.name, @ressource.group_id)
    if (old)
      old.name = @ressource.name
      old.borrow_date = @ressource.borrow_date
      old.estimate_date = @ressource.estimate_date
      old.commentary = @ressource.commentary
      old.group_id = @ressource.group_id
      old.status = @ressource.status
      old.user_id = @ressource.user_id
      @ressource = old
    end
    respond_to do |format|
      if @ressource.save
        format.html { redirect_to @ressource, notice: 'Ressource was successfully created.' }
        format.json { render json: @ressource, status: :created, location: @ressource }
      else
        format.html { render action: "new" }
        format.json { render json: @ressource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ressources/1
  # PUT /ressources/1.json
  def update
    @ressource = Ressource.find(params[:id])

    respond_to do |format|
      if @ressource.update_attributes(params[:ressource])
        format.html { redirect_to @ressource, notice: 'Ressource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ressource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ressources/1
  # DELETE /ressources/1.json
  def destroy
    @ressource = Ressource.find(params[:id])
    @ressource.destroy

    respond_to do |format|
      format.html { redirect_to ressources_url }
      format.json { head :no_content }
    end
  end
  def pdestroy
    @ressource = Ressource.find(params[:id])
    @ressource.destroy

    respond_to do |format|
      format.html { redirect_to ressources_url }
      format.json { head :no_content }
    end
  end
end
