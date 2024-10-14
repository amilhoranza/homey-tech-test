require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      project = Project.new(name: 'Test Project', status: 'in_progress')
      expect(project).to be_valid
    end

    it 'is invalid without a name' do
      project = Project.new(name: nil)
      expect(project).not_to be_valid
      expect(project.errors[:name]).to include("can't be blank")
    end
  end

  describe 'default values' do
    it 'sets the default status to pending if no status is provided' do
      project = Project.create!(name: 'Test Project')
      expect(project.status).to eq('pending')
    end

    it 'does not override status if it is provided' do
      project = Project.create!(name: 'Test Project', status: 'completed')
      expect(project.status).to eq('completed')
    end
  end
end
