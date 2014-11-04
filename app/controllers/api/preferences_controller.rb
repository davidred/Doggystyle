module Api
  class PreferencesController < ApplicationController

    def index
      user = User.find(params[:user_id])
      @preferences = user.preferences
      render json: @preferences
    end

    def create
      user = User.find(params[:user_id])
      @preferences = user.preferences
      fail
      render json: @preferences
    end

    def destroy

    end

    def update

    end

  end

  private

  def update_preferences
    # {"tiny"=>"size", "small"=>"size", "medium"=>"size", "large"=>"size", "friendship"=>"looking_for", "casual_play"=>"looking_for", "breed_partner"=>"looking_for", "male"=>"gender", "female"=>"gender", "near_me"=>"near_me"}
    @user.preferences.destroy_all
    preference_params.each do |val, pref_attr|
      int_val = (pref_attr == "near_me") ? true : convert_to_integer(val, pref_attr)
      @user.preferences.create(preference_attribute: pref_attr, value: int_val)
    end
  end

  def convert_to_integer(val, pref_attr)
    @user.send(pref_attr.pluralize).key(val.to_sym)
  end

  def preference_params
    params.require(:preference).permit(:Tiny,
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
