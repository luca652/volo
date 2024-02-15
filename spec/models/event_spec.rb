require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) {User.create!( first_name: 'Mike', email: 'mike@test.com', password: "123456")}
  let(:group) { Group.create!(name: "Test", location: "7 Craven Road", language: "Italian", user: user)}
  let(:event) { Event.create!(name: "Test event", location: "Westminster", user: user, date: DateTime.now, group: group)}

  it 'has a date in the correct format' do
    p event.date.class
    expect(event.date).to be_a ActiveSupport::TimeWithZone
  end

  it "can't be set in the past" do
    past_date = Date.today - 1
    past_event = Event.new(name: "Past Event", location: "Westminster", date: past_date, user: user, group: group)
    expect(past_event).not_to be_valid
    expect(past_event.errors[:date]).to include("can't be in the past")
  end
end
