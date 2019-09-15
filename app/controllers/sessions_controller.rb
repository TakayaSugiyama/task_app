class SessionsController < ApplicationController
  def new;end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      if @user.admin?
         redirect_to admin_user_path(@user), notice: "ログインしました"
      else  
         redirect_to  user_path(@user), notice: "ログインしました"
      end
    else 
      redirect_to login_path, notice: "ログインに失敗しました"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path,notice: "ログアウトしました"
  end
end
