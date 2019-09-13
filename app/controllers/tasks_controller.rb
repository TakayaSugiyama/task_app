class TasksController < ApplicationController
  before_action :set_task, only: [:show,:edit,:update,:destroy] 
  before_action :forbit_not_login_user
  before_action :only_my_task, only: [:show,:update,:edit,:destroy]

  def index
    @tasks = current_user.tasks.order(created_at: :desc).page(params[:page])
    @q = Task.ransack
    if params[:sort]
      @tasks = current_user.tasks.order(:deadline).page(params[:page])
    elsif params[:priority]
      @tasks = current_user.tasks.order(:priority).page(params[:page])
    elsif params[:q]
      @q = current_user.tasks.ransack(params[:q])
      @tasks = @q.result(distinct: true).page(params[:page])
    end
  end

  def new
    @task = Task.new(flash[:task])
  end

  def show ;end

  def edit;end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save 
      redirect_to @task, notice: "タスク「#{@task.title}」を作成しました"
    else 
      redirect_to new_task_path, flash: {task: @task, error_messages: @task.errors.full_messages}
    end
  end

  def destroy
    @task.destroy 
    redirect_to root_url, notice: "タスク「#{@task.title}」を削除しました"
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: "タスクを更新しました。"
    else 
      flash.now[:error_messages] =  @task.errors.full_messages
      render "tasks/edit"
    end
  end

  private 

  def set_task 
    @task = Task.find(params[:id])
  end

  def task_params 
    params.require(:task).permit(:title,:content,:deadline,:priority,:condition)
  end

  def only_my_task 
    if @task.user != current_user 
      redirect_to root_url, notice: "権限がありません"
    end
  end
  
end
