# StoryGenerator is responsible for generating an instance of Story based on a given prompt.
# It interacts with the OpenAI API to create the story content.
class StoryGenerator
  # Generates a story from the given prompt.
  # Sends a request to the OpenAI API and processes the response to extract the story title and body.
  # @param prompt [Prompt] The prompt object containing the details for the story.
  # @return [Hash] A hash containing the :title and :body of the generated story.
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

  # Extracts the title and body from the response content.
  # Assumes the response content has a title and body separated by '###'.
  #
  # @param response_content [String] The content returned by the API.
  # @return [Hash] A hash with the extracted :title and :body.
  def extract_title_and_story(response_content)
    title, body = response_content.split('###', 2).map(&:strip)
    { title: title, body: body }
  end


  # Formats the request content for the OpenAI API based on the given prompt.
  # @param prompt [Prompt] The prompt object containing the details for the story.
  # @return [String] The formatted request string.
  def request(prompt)
    "Important: this is a story aimed at children. Make the language suitable for children in terms of language used and themes.
     Tell me a story of maximum 250 words in Italian.
     The protagonist is #{prompt.protagonist}.
     The story is set in #{prompt.setting}.
     The protagonist's mortal enemy is #{prompt.enemy}.
     The protagonist's favorite food is #{prompt.food}.
     Start with a title, followed by the delimiter ###, and then the body of the story.
     For example 'Arturo e la foresta oscura ### C'era una volta un bambino di nome Arturo...'"
  end
end
