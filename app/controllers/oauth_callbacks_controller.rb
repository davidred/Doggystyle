class OauthCallbacksController < ApplicationController

  def facebook
    #find or create user
    omniauth = request.env['omniauth.auth']
    user = User.find_by_fb_auth_hash(omniauth)
    #if found, redirect to profile
    if user
      sign_in!(user)
      flash[:notice] = ["Logged in with facebook!"]
      redirect_to user_url(user)
    else
      #else, build up cookie and render sign_up_facebook
      session[:user] ||= {}
      session[:user].merge!(facebook_params(omniauth))
      @user = User.new(session[:user])
      if session[:user].keys == [:email, :omniauthid, :password]
        render :sign_up_facebook_new_user
      else
        render :sign_up_facebook
      end
    end
  end


  private

  def facebook_params(omniauth)
    fb_params = {}
    fb_params[:email] = omniauth.info['email']
    fb_params[:omniauthid] = omniauth['uid'] + omniauth['provider']
    fb_params[:password] = SecureRandom.urlsafe_base64(16)
    fb_params
  end
end
