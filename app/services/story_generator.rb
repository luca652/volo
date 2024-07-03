
class StoryGenerator

  def generate_story(prompt)
    request = request(prompt)

    begin
      response = $open_ai_client.chat(parameters: { model: "gpt-3.5-turbo",
                                                  messages: [{ role: "user",
                                                  content: request }],
                                                  temperature: 0.7 })
      response_content = response.dig("choices", 0, "message", "content")
      extract_title_and_story(response_content)
    rescue StandardError => e
      Rails.logger.error("Error generating story: #{e.message}")
      { title: nil, body: nil }
    end

  end

  def extract_title_and_story(response_content)
    title, body = response_content.split('###', 2).map(&:strip)
    { title: title, body: body }
  end

  def request(prompt)
    "Important: this is a story aimed at children. Make the language suitable for children in terms of language used and themes.
     Tell me a story of maximum 250 words in #{prompt.language}.
     The protagonist is #{prompt.protagonist}.
     The story is set in #{prompt.setting}.
     The protagonist's mortal enemy is #{prompt.enemy}.
     The protagonist's favorite food is #{prompt.food}.
     Start with a title, followed by the delimiter ###, and then the body of the story.
     For example 'Arthur and the dark forest ### Once upon a time Arthy found himself in a dark forest...'"
  end
end
