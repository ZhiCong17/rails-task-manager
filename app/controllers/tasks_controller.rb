class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    redirect_to task_path(@task) if @task.save
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
