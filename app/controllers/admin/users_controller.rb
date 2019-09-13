class Admin::UsersController < ApplicationController
  before_action :forbit_not_login_user, only: [:show,:edit,:update,:destroy]
  before_action :forbid_login_user, only: [:new]
  before_action :only_admin_user, only: %i(index)
  skip_before_action :forbid_login_user, if: proc { params[:admin] }
  before_action :set_user, only: %i(show destroy edit update)
  before_action :only_mypage_user, only: [:show]
  skip_before_action :only_mypage_user, if: proc { params[:admin] }
  

  def new
    @user = User.new(flash[:user])
  end

  def index 
    @users = User.all.select(:id,:name)
  end

  def destroy 
    @user.destroy
    redirect_to  admin_users_path, notice: "「#{@user.name}」を削除しました"
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      session[:user_id] = @user.id
      redirect_to admin_user_path(@user),notice: "登録しました"
    else 
      flash.now[:error_messages] = @user.errors.full_messages
      render "admin/users/new"
    end
  end

  def show;end

  def edkt;end

  def update 
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "更新しました"
    else 
      redirect_to edit_admin_user_path(@user), flash: {error_messages: @user.errors.full_messages}
    end
  end

  private 

  def set_user 
    @user = User.find(params[:id])
  end

  def user_params 
    params.require(:user).permit(:name,:password,:password_confirmation,:email)
  end

  def only_mypage_user 
    if  @user.id != current_user.id 
      redirect_to admin_user_path(current_user),notice: "権限がありません"
    end
  end

  def forbid_login_user 
    if current_user
      redirect_to admin_user_path(current_user),notice: "ログインしています。"
    end
  end

  def only_admin_user 
    unless  current_user.admin? 
        redirect_to admin_user_path(current_user),notice: "管理者のみアクセスできます"
    end
  end
end
