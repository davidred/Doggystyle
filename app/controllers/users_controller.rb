class UsersController < ApplicationController

  include UsersHelper

  def new
    if request.method == "GET"
      @user = User.new
      session[:user] = {}
      render :sign_up_1
    else
      #merge cookie with user_params hash
      session[:user].merge!(user_params)
      #check cookie to determine step
      @user = User.new(session[:user])
      case get_step
      when 1
        render :sign_up_1
      when 2
        render :sign_up_2
      when 3
        render :sign_up_3
      end
    end
  end

  def create
    @user = User.new(session[:user].merge!(user_params))
    if @user.save
      flash[:notice] = ["Successfully created account!"]
      sign_in!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :sign_up_3
    end
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = ["Successfully updated profile"]
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:username,
                                 :password,
                                 :breed,
                                 :gender,
                                 :country,
                                 :zip,
                                 :email,
                                 :summary,
                                 :age,
                                 :size,
                                 :play_style,
                                 :energy_level,
                                 :looking_for_size,
                                 :looking_for_breed,
                                 :looking_for_gender,
                                 :looking_for_location,
                                 :looking_for_distance,
                                 :owner_age,
                                 :owner_photo,
                                 :owner_gender,
                                )
  end

end
