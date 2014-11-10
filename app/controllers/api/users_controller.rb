module Api
  class UsersController < ApiController

    include UsersHelper

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

    def matches
      user = current_user
      breed_preferences, gender_preferences, size_preferences = get_preferences(user)

      if breed_preferences.include?(0)
        @users = User.size(size_preferences)
                     .gender(gender_preferences)
                     .where.not(id: user.id)
      else
        @users = User.size(size_preferences)
                     .gender(gender_preferences)
                     .breed(breed_preferences)
                     .where.not(id: user.id)
      end

      render :index
    end

    def edit
      @users = User.find(params[:id])
      render json: @user
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        render :show
      else
        render json: @user.errors.full_messages, status: :unprocessable_entity
      end
    end

    def inbox
      @messagers = current_user.messagers.distinct
      @user = current_user
      # render json: @messagers
      render :inbox
    end

    def outbox
      @messagers = current_user.messagees
      @user = current_user
      render :inbox
    end

    def photo
      user = User.find(params[:user_id])
      user.profile_photo = params[:new_photo]
      user.save
      render json: user.profile_photo
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
end
