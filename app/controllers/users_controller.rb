class UsersController < ApplicationController

  def new
    if request.method == "GET"
      @user = User.new
      session[:user] = Hash.new()
      render :sign_up_1
    else
      @user = User.new(user_params)
      session[:user][:breed] = user_params["breed"]
      session[:user][:gender] = user_params["gender"]
      fail
      render :sign_up_2
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = ["Successfully created account!"]
      sign_in!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])
    if @user.save
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
    params.require(:user).permit(:username, :password, :breed, :gender, :country, :zip, :email)
  end

end
