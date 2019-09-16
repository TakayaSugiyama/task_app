class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  rescue_from  ActiveRecord::RecordNotFound, with: :error404
  rescue_from Exception, with: :error500 
  rescue_from  ActionController::RoutingError, with: :error404

  def error404
    render "#{Rails.root}/public/404.html",status: 404, formats: %i(html)
  end
 
  def error500
    render "#{Rails.root}/public/500.html",status: 500, formats: %i(html)
  end

  private 

  def forbit_not_login_user 
      redirect_to login_path, notice: "ログインしてください" if  !logged_in? 
  end


end
