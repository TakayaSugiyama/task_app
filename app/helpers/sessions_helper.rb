module SessionsHelper
  def current_user 
    if session[:user_id]
      @current_user ||= User.find(session[:user_id]) 
    end
  end

  def logged_in? 
     if current_user
        true
     else  
        false 
     end
  end
end
