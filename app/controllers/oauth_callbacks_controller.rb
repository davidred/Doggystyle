class OauthCallbacksController < ApplicationController

  def facebook
    session[:user].merge!(facebook_params)
    @user = User.new()
    render '../views/users/sign_up_3.html.erb'
    #user = User.find_or_create_by_fb_auth_hash(request.env['omniauth.auth'])
    #sign_in(user)

    #flash[:success] = "Logged in with facebook!"
    #redirect_to user
  end


  private
  
  def facebook_params
    fb_params = {}
    fb_params[:location] = request.env['omniauth.auth'].info['location']
    fb_params[:email] = request.env['omniauth.auth'].info['email']
    fb_params
  end
end
