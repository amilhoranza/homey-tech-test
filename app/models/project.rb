# == Schema Information
#
# Table name: projects
#
#  id         :bigint           not null, primary key
#  name       :string
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Project < ApplicationRecord
  enum status: { pending: 0, in_progress: 1, completed: 2, archived: 3 }

  has_many :comments
  has_many :history_items

  # Validations
  validates :name, presence: true

  # Callbacks
  before_validation :set_default_status, on: :create

  private

  def set_default_status
    self.status ||= :pending
  end
end
