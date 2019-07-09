class ProjectsController < ApplicationController
  def index
    @projects = Project.all 
  end

  def new
    @project = Project.new 
  end

  def create 
    @project = Project.create(project_params)
    binding.pry
    redirect_to project_path(@project)
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit 
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    if @project.save
      redirect_to @project 
    else
      render :edit 
    end
  end

  private

  def project_params
    params.require(:project).permit(
      :name,
      :description,
      tasks_attributes:[:content, :complete],
      user_ids:[]
    )
  end
    
end
