class ApplicationController < ActionController::Base
  include SessionsHelper

  private 

  def forbit_not_login_user 
    unless logged_in? 
      redirect_to login_path, notice: "ログインしてください"
    end
  end
end
