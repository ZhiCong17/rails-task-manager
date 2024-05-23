class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show
  end

  def create
    @task = Task.new(task_params)

    redirect_to task_path(@task) if @task.save
  end

  def edit
  end

  def update
    @task.update(task_params)

    redirect_to task_path(@task) if @task.save
  end

  def destroy
    @task.destroy

    redirect_to task_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
