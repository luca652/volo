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

end
