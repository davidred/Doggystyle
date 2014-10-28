class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = ["Successfully created account!"]
      redirect_to root_url
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    @user = User.nfind(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])
    if @user.save
      flash[:notice] = ["Successfully updated profile"]
      redirect_to :show
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :breed, :country, :zip, :email)
  end

end
