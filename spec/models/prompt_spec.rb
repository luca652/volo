require 'rails_helper'

RSpec.describe Prompt, type: :model do
  let(:user) {User.create( first_name: 'Mike', email: 'mike@test.com', password: "123456")}
  let(:prompt) { Prompt.new(user_id: user.id, protagonist: "Test name", setting: "Place", food: "Pizza", enemy: "Enemy", language: "Italian")}

  it "has a protagonist" do
    expect(prompt.protagonist).to eq("Test name")
  end

  it "has a setting" do
    expect(prompt.setting).to eq("Place")
  end

  it "has a favorite food" do
    expect(prompt.food).to eq("Pizza")
  end

  it "has an enemy" do
    expect(prompt.enemy).to eq("Enemy")
  end

  it "has a language" do
    expect(prompt.language).to eq("Italian")
  end

  it "belongs to a user" do
    expect(prompt.user).to eq(user)
  end
end
