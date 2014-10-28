class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(user_params)
    if @user
      sign_in!(@user)
      flash[:notice] = ["Successfully logged in"]
      redirect_to root_url
    else
      flash.now[:errors] = ["Incorrect username or password."]
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to new_session_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :breed, :country, :zip, :email)
  end

end
