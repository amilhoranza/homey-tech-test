class Api::V1::ProjectsController < Api::ApplicationApiController
  def index
    projects = Project.all.order(created_at: :desc)
    render json: projects, status: :ok
  end

  def show
    project = Project.find(params[:id])
    render json: { project: project, history: project.history_items.order(created_at: :desc) }, status: :ok
  end

  def create
    project = Project.new(project_params)
    if project.save
      render json: project, status: :created
    else
      render json: { errors: project.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :status)
  end
end
