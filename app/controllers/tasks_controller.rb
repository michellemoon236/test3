class TasksController < ApplicationController

  def
  def complete_task
    @task = Task.find(params[:id])
    @task.complete = true
    @task.save
    redirect_to project_path(@task.project_id)
  end
  
end
