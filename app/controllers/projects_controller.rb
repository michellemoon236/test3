class ProjectsController < ApplicationController
  def index
    @projects = Project.all.select { |project| project.users.include?(current_user) }
    binding.pry
  end

  def new
    @project = Project.new 
    8.times do 
      @project.tasks.build
    end
  end

  def create 
    @project = Project.new(project_params)
    @project.user_projects.each do |user_project|
      if user_project.user_id == current_user.id
        user_project.project_creator = true
      end 
    end
    if @project.save
      redirect_to project_path(@project)
    else
      flash[:error] = @project.errors.full_messages
      render :new
    end
    binding.pry
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit 
    @project = Project.find(params[:id])
    binding.pry
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
      tasks_attributes:[:content, :complete, :project_id, :id],
      user_ids:[]
    )
  end
    
end
