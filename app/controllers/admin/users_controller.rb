class Admin::UsersController < ApplicationController
  before_action :forbit_not_login_user 
  before_action :only_admin_user
  before_action :set_user, only: %i(show destroy edit update remove add)
  before_action :not_delete_my_self, only: %i(destroy, remove)
  

  def new
    @user = User.new(flash[:user])
  end

  def index 
    @users = User.all.select(:id,:name,:admin).order(id: :asc)
  end

  def destroy 
    @user.destroy
    redirect_to  admin_users_path, notice: "「#{@user.name}」を削除しました"
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      redirect_to admin_users_path,notice: "登録しました"
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
  
  #リファクタリング対象
  def  add
    redirect_to admin_users_path if @user.update(admin: true)
  end

  def remove 
    redirect_to admin_users_path if @user.update(admin: false)
  end
  #リファクタリング対象 ここまで

  private 

    def set_user 
      @user = User.find(params[:id])
    end

    def user_params 
      params.require(:user).permit(:name,:password,:password_confirmation,:email,:admin)
    end

    def only_admin_user 
      redirect_to forbidden_path,notice: "管理者のみアクセスできます" unless  current_user.admin? 
    end

    def not_delete_my_self  
        redirect_to root_url, notice: "自分自身は削除できません。" if @user == current_user
    end
    
end
