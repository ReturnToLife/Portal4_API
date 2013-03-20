class ApiSessionController < ApplicationController

  def create
    @user = User.find_by_login(params[:login])

    respond_to do |format|
      if @user == nil || @user.valid_password?(params[:password]) == false
        format.html # create.html.erb
        format.json { render json: "error" }
      else
        if (@user.authentication_token == nil)
          @user.newtoken
        end
        format.html # create.html.erb
        format.json { render json: @user.authentication_token }
      end
    end
  end

  def show
    @user = User.find_by_authentication_token(params[:auth_token])
    if (@user == nil)
      respond_to do |format|
        format.html # create.html.erb
        format.json { render json: "Invalid token" }
      end
    else
      @user.authentication_token = nil
      @user.save
      respond_to do |format|
        format.html # create.html.erb
        format.json { render json: "token erased" }
      end
    end
  end
end
  
