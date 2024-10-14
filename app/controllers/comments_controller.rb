class CommentsController < ApplicationController
  def create
    project = Project.find(params[:project_id])
    AddCommentService.new(project, comment_params, current_user).call
    redirect_to project_path(project)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
