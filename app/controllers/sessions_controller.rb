class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(user_params)
    if @user
      session[:token] = @user.reset_session_token!
      flash[:notice] = "Successfully logged in"
      redirect_to root_url
    else
      flash[:errors] = "Incorrect username or password."
      render :new
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:token] = nil
    redirect_to new_session_url
  end

end
