require 'rails_helper'

RSpec.describe "Story Generator", type: :system do
  let(:user) { User.find_by(email: "vittoria@me.com") }

  before do
    visit new_user_session_path

    fill_in 'Email', with: "vittoria@me.come"
    fill_in 'Password', with: "123456"

    click_button 'Log in'
  end

  it "visits the Story Generator page" do
    visit new_story_path
    expect(page).to have_content("Story generator")
  end
end
