class GamesController < ApplicationController

  def quiz
    @openai_client = OpenAI::Client.new
    prompt = "You are a quiz master. Speak in Italian. Ask me simple questions with a one word answer. Ask me one question at a time."
    response = @openai_client.chat(
      parameters: {
        model:  "gpt-3.5-turbo",
        messages: [{ role:  "user", content:  prompt}],
        temperature:  0.7,
     }
    )

    # Extract the generated text from the response
    @question = response.dig("choices", 0, "message", "content")

    # Return the generated text
    # render plain: generated_text
  end



  def next_question
    prompt = "You are a quiz master. Speak in Italian. Ask me simple questions with a one word answer. Ask me one question at a time."
    response = @openai_client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: prompt}],
        temperature:  0.7,
      }
    )

    # Extract the generated text from the response
    @generated_text = response.dig("choices", 0, "message", "content")

    # Return the generated text
    # render plain: generated_text
  end

  # def chat
  #   # Retrieve user input from the request parameters
  #   user_input = params[:message]

  #   # Initialize the conversation history with the user's message
  #   conversation = [
  #     { 'role' => 'system', 'content' => 'You are a quiz master.' },
  #     { 'role' => 'user', 'content' => user_input }
  #   ]

  #   # Make the API call to the OpenAI API
  #   response = OpenAI::ChatCompletion.create(
  #     model: 'gpt-3.5-turbo',
  #     messages: conversation
  #   )

  #   # Retrieve the bot's reply from the API response
  #   bot_reply = response['choices'][0]['message']['content']

  #   # Render the bot's reply as a JSON response
  #   render json: { message: bot_reply }
  # end

end
