json.extract! @user, :id, :username, :breed_name, :gender_name, :country_name, :zip, :summary, :age, :size_name, :play_style_name, :energy_level_name, :owner_name, :owner_age, :owner_gender_name

json.preferences @user.preferences, :preference_attribute, :value