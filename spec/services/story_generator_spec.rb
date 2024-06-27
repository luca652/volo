require 'rails_helper'
require 'story_generator'

RSpec.describe StoryGenerator do
  before(:each) do
    @prompt = Prompt.new(
      protagonist: "Stefano",
      language: "Italiano",
      setting: "Un bosco",
      enemy: "Il drago rosso",
      food: "Trenette col pesto"
    )
    @generator = StoryGenerator.new
  end

  describe "#generate_story" do
    it "returns a valid story hash" do
      story = @generator.generate_story(@prompt)
      expect(story[:title]).not_to be_nil
      expect(story[:story]).not_to be_nil
    end
  end

  describe "#extract_title_and_story" do
    it "correctly parses title and story" do
      generated_story = "Stefano nel bosco oscuro # C'era una volta..."
      title_and_story = @generator.send(:extract_title_and_story, generated_story)
      expect(title_and_story[:title]).to eq("Stefano nel bosco oscuro")
      expect(title_and_story[:story]).to eq("C'era una volta...")
    end
  end
end
