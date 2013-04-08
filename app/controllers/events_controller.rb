# -*- coding: utf-8 -*-
class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  # before_filter :authenticate_user!, :if => Proc.new { |c| c.request.format == 'application/json' }  
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

  def index
    ensure :authenticate_user!
    @events = Event.all
    array = []
    @events.each do |event|
      hash = {}
      event.attribute_names.each {|var| hash[var] = event.instance_variable_get("@attributes")[var] }
      user = User.find(event.user_id)
      # hash["login"] = user.login
      array.append(hash)
    end
    print array
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: array }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    array = []
    hash = {}
    @event.attribute_names.each {|var| hash[var] = @event.instance_variable_get("@attributes")[var] }  

    user_event = User.find(@event.user_id)
    res = {:event => hash, :login => user_event.login}
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: res }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    debugger
    @event = Event.find(params[:id])
    array = []
    hash = {}
    @event.attribute_names.each {|var| hash[var] = @event.instance_variable_get("@attributes")[var] }  

    user_event = User.find(@event.user_id)
    res = {:event => hash, :login => user_event.login}
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: res }
    end
  end

  # POST /events
  # POST /events.json
  def create
    @user = User.find_by_authentication_token(params[:auth_token])
    @event = Event.new.from_json(params[:event])
    @event.user_id = @user.id
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1/update
  # PUT /events/1/update.json
  def pupdate
    @event = Event.find(params[:id])
    respond_to do |format|
      if @event.update_attributes(JSON.parse(params[:event]))
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content}
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])
    debugger
    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
end
