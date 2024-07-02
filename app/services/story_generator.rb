
class StoryGenerator

  def generate_story(prompt)
    request = request(prompt)
    response = $open_ai_client.chat(parameters: { model: "gpt-3.5-turbo",
                                                  messages: [{ role: "user",
                                                  content: request }],
                                                  temperature: 0.7 })
    response_content = response.dig("choices", 0, "message", "content")
    extract_title_and_story(response_content)
  end

  def extract_title_and_story(response_content)
    generated_story = { title: response_content.partition("#").first.strip,
                        body: response_content.partition("#").last.strip }
  end

  def request(prompt)
    request = "Important: this is a story aimed at children.
               Make the language suitable for children in terms of language used and themes.
               Tell me a story of maximum 250 words in #{prompt.language}.
               The protagonist is #{prompt.protagonist}.
               The story is set in #{prompt.setting}.
               The protagonist's mortal enemy is #{prompt.enemy}.
               The protagonist's favorite food is #{prompt.food}.
               Start with a title, something like 'Arthur and the dark forest'.
               Put a # at the end of the title."
  end
end
