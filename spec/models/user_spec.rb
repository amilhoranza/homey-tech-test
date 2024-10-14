require 'rails_helper'

RSpec.describe User, type: :model do
  it 'creates an admin user' do
    admin_user = create(:user, :admin)
    expect(admin_user.admin?).to be(true)
  end

  it 'creates a regular user' do
    regular_user = create(:user, :regular)
    expect(regular_user.admin?).to be(false)
  end
end
