require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) {User.create( first_name: 'Mike', email: 'test@test.com', password: "123456")}
  let(:group) { Group.create(name: "Test", location: "7 Craven Road", language: "Italian", user: user)}

  it 'has a name' do
    expect(group.name).to eq "Test"
  end

  it 'can be renamed' do
    group.name = "Test 2"
    expect(group.name).to eq "Test 2"
  end

  it 'belongs to a user' do
    expect(group.user).to eq user
  end

  describe '#members' do

    it 'returns all users that have been accepted into a group' do
      group.requests.create(user: user, accepted: true)
      expect(group.members).to include(user), "usere was not included despite accepted request"
    end

    it 'will only return users whose requests to join have been accepted' do
      group.requests.create(user: user, accepted: false)
      expect(group.members).not_to include(user), "user was included without accepted request"
    end
  end
end
