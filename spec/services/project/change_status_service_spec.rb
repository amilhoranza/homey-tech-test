require 'rails_helper'

RSpec.describe ChangeStatusService do
  let(:project) { create(:project, status: :pending) }
  let(:admin) { create(:user, :admin) }
  let(:user) { create(:user) }

  describe '#call' do
    context 'when user is an admin' do
      it 'changes the status of the project' do
        service = ChangeStatusService.new(project, 'completed', admin)
        expect { service.call }.to change { project.reload.status }.to('completed')
      end

      it 'creates a history item for the status change' do
        service = ChangeStatusService.new(project, 'completed', admin)
        expect { service.call }.to change { project.history_items.count }.by(1)
        history_item = project.history_items.last
        expect(history_item.description).to eq('Status changed to completed')
      end
    end

    context 'when user is not an admin' do
      it 'raises an UnauthorizedError' do
        service = ChangeStatusService.new(project, 'completed', user)
        expect { service.call }.to raise_error(ChangeStatusService::UnauthorizedError, 'You are not authorized to change the status')
      end
    end

    context 'when an invalid status is provided' do
      it 'raises an InvalidStatusError' do
        service = ChangeStatusService.new(project, 'invalid_status', admin)
        expect { service.call }.to raise_error(ChangeStatusService::InvalidStatusError, 'Invalid status provided')
      end
    end

    context 'when project update fails' do
      before do
        allow(project).to receive(:update!).and_raise(ActiveRecord::RecordInvalid.new(project))
      end

      it 'raises an UpdateStatusError' do
        service = ChangeStatusService.new(project, 'completed', admin)
        expect { service.call }.to raise_error(ChangeStatusService::UpdateStatusError, /Failed to update status/)
      end
    end
  end
end
