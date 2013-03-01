class ApiSessionController < ApplicationController

  def create
    user = User.find_by_login(params[:login])
    if user == nil || user.valid_password?(params[:password]) == false
      respond_to do |format|
        format.html # create.html.erb
        format.json { render json: "error" }
      end
      else
      respond_to do |format|
        format.html # create.html.erb
        format.json { render json: user.authentication_token }
      end
    end
  end
end
  
