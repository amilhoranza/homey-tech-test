require 'rails_helper'

RSpec.describe AddCommentService do
  let(:project) { create(:project) }
  let(:user) { create(:user) }
  let(:comment_params) { { content: "This is a test comment" } }

  subject { described_class.new(project, comment_params, user) }

  describe '#call' do
    it 'creates a comment for the project' do
      expect { subject.call }.to change { project.comments.count }.by(1)
    end

    it 'associates the comment with the correct user' do
      subject.call
      comment = project.comments.last
      expect(comment.user).to eq(user)
    end

    it 'creates a history item for the comment' do
      expect { subject.call }.to change { project.history_items.count }.by(1)
    end

    it 'associates the history item with the correct user and comment' do
      subject.call
      history_item = project.history_items.last
      comment = project.comments.last
      expect(history_item.user).to eq(user)
      expect(history_item.item).to eq(comment)
      expect(history_item.description).to eq("Comment added")
    end
  end
end
