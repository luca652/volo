# require 'rails_helper'

# RSpec.describe "Story Generator", type: :system do
#   let(:user) { User.create!(first_name: "test", email: "test@test.com", password: "password") }

#   before do

#     visit new_user_registration_path

#     fill_in 'Email', with: user.email
#     fill_in 'user_password', with: user.password
#     fill_in 'user_password_confirmation', with: user.password

#     click_button 'Sign up'

#     visit new_user_session_path

#     fill_in 'Email', with: user.email
#     fill_in 'Password', with: user.password
#     puts "User email: #{user.email}"
#     puts "User password: #{user.password}"
#     click_button 'Log in'
#     puts "Login attempt completed"
#   end

#   it "visits the Story Generator page" do
#     visit new_story_path
#     expect(page).to have_content("Story generator")
#   end
# end
