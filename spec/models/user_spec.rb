require 'rails_helper'

RSpec.describe User do
  let(:user) { User.create(email: "user_1@test.com", password: "123456", first_name: 'John') }
  let(:user_2) { User.create(email: "user_2@test.com", password: "123456", first_name: 'Steve') }
  let(:resource) { Resource.create!(title: "test_resource", user_id: user.id)}
  let(:group_1) { Group.create(user_id: user.id, name: 'Group 1') }
  let(:group_2) { Group.create(user_id: user.id, name: 'Group 2') }
  let(:group_3) { Group.create(user_id: user_2.id, name: 'Group 3') }
  let(:event) { Event.create!(user_id: user.id, group_id: group_1.id)}


  it 'has many groups' do
    expect(user.groups).to include(group_1, group_2)
    expect(user.groups.count).to eq(2)
  end

  describe '#has_pinned?(resource)' do
    it 'returns false if user has not pinned resource' do
      expect(user.has_pinned?(resource)).to eq(false)
    end

    it 'returns true if user has pinned resource' do
      Pin.create( user_id: user.id, resource_id: resource.id)
      expect(user.has_pinned?(resource)).to eq(true)
    end
  end

  describe '#resource_creator?(resource)' do
    it 'returns true if user created resource' do
      expect(user.resource_creator?(resource)).to eq(true)
    end

    it 'returns false if user did not create resource' do
      expect(user_2.resource_creator?(resource)).to eq(false)
    end
  end

  describe '#group_admin?(group)' do
    it 'returns false if user has not created the group' do
      expect(user.group_admin?(group_3)).to eq(false)
    end

    it 'returns true if user has created the group' do
      expect(user.group_admin?(group_1)).to eq(true)
    end
  end

  describe '#event_creator?(event)' do
    it 'returns true if user created event' do
      expect(user.event_creator?(event)).to eq(true)
    end

    it 'returns false if user did not create event' do
      expect(user_2.event_creator?(event)).to eq(false)
    end
  end
end
