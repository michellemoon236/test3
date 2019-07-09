class TasksController < ApplicationController

  def complete_task
    @task = Task.find(params[:id])
    @task.complete = true
    @task.save
    redirect_to project_path(@project)
  end
  
end
