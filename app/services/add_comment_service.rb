class AddCommentService
  def initialize(project, comment_params, user)
    @project = project
    @comment_params = comment_params
    @user = user
  end

  def call
    comment = project.comments.create!(comment_params.merge(user: user))
    HistoryItem.create!(project: project, user: user, item: comment, description: "Comment added")
  end

  private

  attr_reader :project, :comment_params, :user
end
