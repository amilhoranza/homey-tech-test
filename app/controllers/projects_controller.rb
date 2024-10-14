class ProjectsController < ApplicationController
  def index
    @projects = Project.all.order(created_at: :desc)
  end

  def show
    @project = Project.find(params[:id])
    @history = @project.history_items.order(created_at: :desc).preload(:project, :item, :user)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :status)
  end
end
