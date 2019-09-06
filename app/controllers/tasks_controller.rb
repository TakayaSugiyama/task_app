class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(updated_at: :desc)
  end

  def new
  end

  def show
  end

  def edit
  end

  def create
  end

  def destroy
  end

  def update
  end
end
