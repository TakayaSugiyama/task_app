class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def new
    @user = User.new(flash[:user])
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      redirect_to @user,notice: "登録しました"
    else 
      redirect_to new_user_path, flash: {user: @user,error_messages:@user.errors.full_messages}
    end
  end

  def show;end

  private 

  def set_user 
    @user = User.find(params[:id])
  end

  def user_params 
    params.require(:user).permit(:name,:password,:password_confirmation,:email)
  end

  def only_mypage_user 
    unless @user.id == current_user.id 
      redirect_to user_path(current_user),notice: "権限がありません"
    end
  end
end
