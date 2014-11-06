module UsersHelper
  def get_step
    keys = session[:user].keys

    if keys == ["breed", "gender"]
      return 2
    elsif keys == ["breed", "gender", "country", "zip", "email"]
      if validate_sign_up_2
        return 3
      else
        return 2
      end
    elsif keys == []
      return 1
    end
  end

  def validate_sign_up_2
    validate = true
    flash.now[:errors] = []
    if session[:user]["zip"].empty?
      flash.now[:errors] << "zip cannot be blank"
      validate = false
    end
    if session[:user]["email"].empty?
      flash.now[:errors] << "email cannot be blank"
      validate = false
    end
    validate
  end

  def update_preferences
    # {"tiny"=>"size", "small"=>"size", "medium"=>"size", "large"=>"size", "friendship"=>"looking_for", "casual_play"=>"looking_for", "breed_partner"=>"looking_for", "male"=>"gender", "female"=>"gender", "near_me"=>"near_me"}
    @user.preferences.destroy_all
    preference_params.each do |val, pref_attr|
      int_val = (pref_attr == "near_me") ? true : convert_to_integer(val, pref_attr)
      @user.preferences.create(preference_attribute: pref_attr, value: int_val)
    end
  end

  def default_preferences(user)
    user.preferences.create(preference_attribute: "looking_for", value: 1)
    user.preferences.create(preference_attribute: "looking_for", value: 2)
    user.preferences.create(preference_attribute: "looking_for", value: 3)
    user.preferences.create(preference_attribute: "gender", value: 1)
    user.preferences.create(preference_attribute: "gender", value: 2)
    user.preferences.create(preference_attribute: "size", value: 1)
    user.preferences.create(preference_attribute: "size", value: 2)
    user.preferences.create(preference_attribute: "size", value: 3)
    user.preferences.create(preference_attribute: "size", value: 4)
    user.preferences.create(preference_attribute: "breed", value: 0)
  end

  def convert_to_integer(val, pref_attr)
    @user.send(pref_attr.pluralize).key(val.to_sym)
  end

  def get_preferences(user)
    preferences = user.preferences

    breed_preferences = preferences
                            .where(preference_attribute: "breed")
                            .map { |preference| preference.value }
    gender_preferences = preferences
                             .where(preference_attribute: "gender")
                             .map { |preference| preference.value }
    size_preferences = preferences
                           .where(preference_attribute: "size")
                           .map { |preference| preference.value }

    [breed_preferences, gender_preferences, size_preferences]
  end




end
