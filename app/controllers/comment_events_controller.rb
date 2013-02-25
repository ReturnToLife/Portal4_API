class CommentEventsController < ApplicationController
  # GET /comment_events
  # GET /comment_events.json
  def index
    @comment_events = CommentEvent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comment_events }
    end
  end

  # GET /comment_events/1
  # GET /comment_events/1.json
  def show
    @comment_event = CommentEvent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment_event }
    end
  end

  # GET /comment_events/new
  # GET /comment_events/new.json
  def new
    @comment_event = CommentEvent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment_event }
    end
  end

  # GET /comment_events/1/edit
  def edit
    @comment_event = CommentEvent.find(params[:id])
  end

  # POST /comment_events
  # POST /comment_events.json
  def create
    @comment_event = CommentEvent.new(params[:comment_event])

    respond_to do |format|
      if @comment_event.save
        format.html { redirect_to @comment_event, notice: 'Comment event was successfully created.' }
        format.json { render json: @comment_event, status: :created, location: @comment_event }
      else
        format.html { render action: "new" }
        format.json { render json: @comment_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comment_events/1
  # PUT /comment_events/1.json
  def update
    @comment_event = CommentEvent.find(params[:id])

    respond_to do |format|
      if @comment_event.update_attributes(params[:comment_event])
        format.html { redirect_to @comment_event, notice: 'Comment event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_events/1
  # DELETE /comment_events/1.json
  def destroy
    @comment_event = CommentEvent.find(params[:id])
    @comment_event.destroy

    respond_to do |format|
      format.html { redirect_to comment_events_url }
      format.json { head :no_content }
    end
  end
end
