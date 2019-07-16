class TasksController < ApplicationController

  #required nested index or show route

  def new
    @task = Task.new(project_id: params[:project_id])
    binding.pry
  end

  def create 
    @task = Task.create(task_params)
    redirect_to project_path(@project)
  end

  def task_complete
    binding.pry
    @task = Task.find(params[:task][:id])
    @task.complete = true
    @task.save
    binding.pry
    redirect_to project_path(id: @task.project_id)
  end
  
  private

  def task_params
    params.require(:task).permit(:content, :project_id)
  end

end
