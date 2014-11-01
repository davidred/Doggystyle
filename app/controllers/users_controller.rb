class UsersController < ApplicationController

  before_action :require_current_user, except: [:new, :create]

  include UsersHelper

  def new
    if request.method == "GET"
      @user = User.new
      session[:user] = {}
      render :sign_up_1, layout: "sign_up"
    else
      #merge cookie with user_params hash
      session[:user].merge!(user_params)
      #check cookie to determine step
      @user = User.new(session[:user])
      case get_step
      when 1
        render :sign_up_1, layout: "sign_up"
      when 2
        render :sign_up_2, layout: "sign_up"
      when 3
        render :sign_up_3, layout: "sign_up"
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
      render :sign_up_3, layout: "sign_up"
    end
  end

  def edit
    @user = User.find(params[:id])
    render :edit, layout: "signed_in"
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = ["Successfully updated profile"]
      if update_preferences
        redirect_to user_url(@user)
      else
        render :edit, layout: "signed_in"
      end
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit, layout: "signed_in"
    end
  end

  def show
    @user = User.find(params[:id])
    render :show, layout: "signed_in"
  end

  def index
    @users = User.all
    render :index, layout: "signed_in"
  end

  def inbox
    @messagers = current_user.messagers.distinct
    render :inbox, layout: "signed_in"
  end

  def outbox
    @messagees = current_user.messagees.distinct
    render :outbox, layout: "signed_in"
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
                                 :owner_age,
                                 :owner_photo,
                                 :owner_gender)
  end

  def preference_params
    params.require(:user).permit(:Tiny,
                                 :Small,
                                 :Medium,
                                 :Large,
                                 :Friendship,
                                 :"Casual Play",
                                 :"Breeding Partner",
                                 :Male,
                                 :Female,
                                 :near_me)

  end
end