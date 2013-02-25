class GossipsController < ApplicationController
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

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gossip }
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
    @gossip = Gossip.new(params[:gossip])

    respond_to do |format|
      if @gossip.save
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
