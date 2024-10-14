# == Schema Information
#
# Table name: history_items
#
#  id          :bigint           not null, primary key
#  description :string
#  item_type   :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  item_id     :bigint           not null
#  project_id  :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_history_items_on_item        (item_type,item_id)
#  index_history_items_on_project_id  (project_id)
#  index_history_items_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class HistoryItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
