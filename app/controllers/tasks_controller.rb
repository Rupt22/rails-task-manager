class TasksController < ApplicationController
  def tasks

  end

  def edit
    @task = Task.find(params[:id])
  end 

  def new
    @task = Task.new
  end

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end
  def create
    @task = Task.new(task_params)
    @task.save
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params) # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end 

  private

    def task_params
    params.require(:task).permit(:title, :details, :completed)
    end

end



#this action should fetch all tasks, and a view should loop over these to display them, like in the screenshot below.