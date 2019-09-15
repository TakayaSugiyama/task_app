class ApplicationController < ActionController::Base
  include SessionsHelper

  private 

  def forbit_not_login_user 
      redirect_to login_path, notice: "ログインしてください" if  !logged_in? 
  end

end
