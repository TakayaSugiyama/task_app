class TasksController < ApplicationController
  before_action :set_task, only: [:show]

  def index
    @tasks = Task.all.order(updated_at: :desc)
  end

  def new
    @task = Task.new(flash[:task])
  end

  def show ;end

  def edit
  end

  def create
    @task = Task.new(task_params)
    if @task.save 
      redirect_to @task, notice: "タスク「#{@task.title}」を作成しました"
    else 
      redirect_to new_task_path, flash: {task: @task, error_messages: @task.errors.full_messages}
    end
  end

  def destroy
  end

  def update
  end

  private 

  def set_task 
    @task = Task.find(params[:id])
  end

  def task_params 
    params.require(:task).permit(:title,:content)
  end
end
