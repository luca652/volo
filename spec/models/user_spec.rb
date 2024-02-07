require 'rails_helper'

RSpec.describe User do
  let(:user) { User.create(email: "test@test.come", password: "123456", first_name: 'Test') }
  let(:group1) { Group.create(user_id: user.id, name: 'Group 1') }
  let(:group2) { Group.create(user_id: user.id, name: 'Group 2') }

  it 'has many groups' do
    expect(user.groups).to include(group1, group2)
    expect(user.groups.count).to eq(2)
  end
end
