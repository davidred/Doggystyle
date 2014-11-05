module Api
  class PreferencesController < ApplicationController

    def index
      user = User.find(params[:user_id])
      @preferences = user.preferences
      render json: @preferences
    end

    def create
      @user = User.find(params[:user_id])
      @preferences = @user.preferences
      # {"Tiny"=>"size", "Small"=>"size", "Medium"=>"size", "Large"=>"size", "Friendship"=>"play", "Playmate"=>"play", "breed_partner"=>"play", "Male"=>"gender", "Female"=>"gender", "near_me"=>"near_me"}
      @user.preferences.destroy_all
      preference_params.each do |val, pref_attr|
        puts "#{pref_attr}"
        puts "#{val}"
        int_val = (pref_attr == "near_me") ? true : convert_to_integer(val, pref_attr)
        puts "#{int_val}"
        @user.preferences.create(preference_attribute: pref_attr, value: int_val)
      end
      
      @user.preferences.create(preference_attribute: 'breed', value: params[:preference][:breed])
      render json: @user.preferences
    end

    private

    def update_preferences

      @user.preferences.destroy_all
      preference_params.each do |val, pref_attr|
        int_val = convert_to_integer(val, pref_attr)
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
                                         :"Playmate",
                                         :"Having Puppies",
                                         :Male,
                                         :Female,
                                         :near_me)

    end
  end

end
