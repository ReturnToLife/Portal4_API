class ApiSessionController < ApplicationController

  def create
    user = User.find_by_login(params[:login])
    
    respond_to do |format|
      format.html # create.html.erb
      format.json { render json: user.authentication_token }
    end
  end
end
