class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    
    if @project.save
      flash[:notice] = "Project has been created."
      return redirect_to @project
    end

    flash[:alert] = "Project has not been created."
    render :action => "new"
  end

  def edit
  end
 
  def update
    if @project.update(project_params)
      flash[:notice] = 'Project has been updated'
      return redirect_to @project
    end
    flash[:notice] = 'Project has not been updated'
    render action: 'edit'  
  end

  def destroy
    @project.destroy
    flash[:notice] = 'Project has been destroyed'
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def find_project
    @project = Project.find(params[:id])
  end
end
