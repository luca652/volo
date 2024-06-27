require 'rails_helper'

RSpec.describe Story, type: :model do
  let(:user) { User.create(email: "user_1@test.com", password: "123456", first_name: 'John') }
  let(:story) {Story.create(title: "Test Title", content: "Engaging story", user_id: user.id )}


  it "has a title" do
    expect(story.title).to eq("Test Title")
  end

  it "has content" do
    expect(story.content).to eq("Engaging story")
  end

  it "cannot be created without a title" do
    story.title = nil
    expect(story).not_to be_valid
  end

  it "cannot be created without content" do
    story.content = nil
    expect(story).not_to be_valid
  end
end
