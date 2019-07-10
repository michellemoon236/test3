class TasksController < ApplicationController

  def task_complete
    binding.pry
    @task = Task.find(params[:id])
    @task.complete = true
    @task.save
    binding.pry
    redirect_to project_path(id: @task.project_id)
  end
  
end
