require 'rails_helper'
require 'story_generator'

RSpec.describe StoryGenerator do
  let(:user) {User.create!( first_name: 'Mike', email: 'mike@test.com', password: "123456")}
  let(:prompt) { Prompt.create( protagonist: "Stefano",
                                language: "Italiano",
                                 setting: "Bosco",
                                   enemy: "Il drago rosso",
                                    food: "Trenette col pesto",
                                 user_id: user.id)}

  describe '#generate_story' do
    it 'generates a story with title and body' do

      response_content = "#{prompt.protagonist} e le avventure nel #{prompt.setting} # Una volta... #{prompt.protagonist} fece un giro in un #{prompt.setting}."

      allow($open_ai_client).to receive(:chat).and_return({
        "choices" => [{ "message" => { "content" => response_content } }]
      })

      generator = StoryGenerator.new
      generated_story = generator.generate_story(prompt)

      expect(generated_story).to be_a(Hash)
      expect(generated_story.keys).to contain_exactly(:title, :body)
      expect(generated_story[:title]).to eq("Stefano e le avventure nel Bosco")
      expect(generated_story[:body]).to eq("Una volta... Stefano fece un giro in un Bosco.")
    end
  end
end
