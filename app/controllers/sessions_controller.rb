class SessionsController < ApplicationController

  def new
    render :new, layout: 'sign_up'
  end

  def create
    @user = User.find_by_credentials(user_params)
    if @user
      sign_in!(@user)
      flash[:notice] = ["Successfully logged in"]
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ["Incorrect username or password."]
      render :new, layout: 'sign_up'
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
