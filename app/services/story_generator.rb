
class StoryGenerator

  def generate_story(prompt)
    request = "Tell me a story of maximum 250 words in #{prompt.language}. The protagonist is #{prompt.protagonist},
    and the story is set in #{prompt.setting}. His mortal enemy is #{prompt.enemy}, and his/her favorite food is #{prompt.food}.
    Start with a title, something like 'Arthur and the dark forest'. Put a # at the end of the title."

    response = $open_ai_client.chat(parameters: { model: "gpt-3.5-turbo", messages: [{ role: "user", content: request }],
                                                  temperature: 0.7 })
    generated_story = response.dig("choices", 0, "message", "content")
    extract_title_and_story(generated_story)
  end

  def extract_title_and_story(generated_story)
    title_and_story = { title: generated_story.partition("#").first.strip,
                        story: generated_story.partition("#").last.strip }
    title_and_story
  end
end
