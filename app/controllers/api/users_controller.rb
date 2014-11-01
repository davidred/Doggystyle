module Api
  class UsersController < ApiController
    def show
      @user = User.find(params[:id])
      # render json: @user
      render :show
    end
    
    def index
      @users = User.all
      # render json: @users
      render :index
    end
    
    def edit
      @users = User.find(params[:id])
      render json: @user
    end
    
    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        render json: @user
      else
        flash[:errors] = @user.errors.full_messages
        render json: @user
      end
    end
    
    private
    
    def user_params 
      params.require(:user).permit()
    end
  end
end