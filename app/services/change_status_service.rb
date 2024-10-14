class ChangeStatusService
  def initialize(project, new_status, user)
    @project = project
    @new_status = new_status
    @user = user
  end

  def call
    raise UnauthorizedError, 'You are not authorized to change the status' unless user.admin?
    raise InvalidStatusError, 'Invalid status provided' unless Project.statuses.keys.include?(new_status)

    project.update!(status: new_status)
    HistoryItem.create!(project: project, user: user, item: project, description: "Status changed to #{new_status}")
  rescue ActiveRecord::RecordInvalid => e
    raise UpdateStatusError, "Failed to update status: #{e.message}"
  end

  private

  attr_reader :project, :new_status, :user

  class UnauthorizedError < StandardError; end
  class InvalidStatusError < StandardError; end
  class UpdateStatusError < StandardError; end
end
