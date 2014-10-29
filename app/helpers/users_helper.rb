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
    else
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
  
  
end
