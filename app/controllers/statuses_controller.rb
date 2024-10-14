class StatusesController < ApplicationController
  before_action :ensure_admin!

  def update
    project = Project.find(params[:project_id])

    begin
      ChangeStatusService.new(project, params[:status], current_user).call
      redirect_to project_path(project), notice: "Project status updated successfully."
    rescue ChangeStatusService::UnauthorizedError => e
      redirect_to project_path(project), alert: e.message
    rescue ChangeStatusService::InvalidStatusError => e
      redirect_to project_path(project), alert: e.message
    rescue ChangeStatusService::UpdateStatusError => e
      redirect_to project_path(project), alert: e.message
    end
  end

  private

  def ensure_admin!
    unless current_user.admin?
      redirect_to root_path, alert: "You are not authorized to change the project status."
    end
  end
end
