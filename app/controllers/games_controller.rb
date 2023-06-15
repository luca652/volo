class GamesController < ApplicationController

  def index
    @game = Game.new
    @answer = Answer.new
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user
    if @game.save
      redirect_to game_path(@game)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @game = Game.find(params[:id])
    @openai_client = OpenAI::Client.new
    prompt = "You are a quiz master. Speak in Italian. Ask me simple questions with a one word answer.
              Ask me one question at a time. Address me using my #{@game.nickname}"
    response = @openai_client.chat(
      parameters: {
        model:  "gpt-3.5-turbo",
        messages: [{ role:  "user", content:  prompt}],
        temperature:  0.7,
     }
    )
    @question = response.dig("choices", 0, "message", "content")
    @answer = Answer.new
  end

  def answer
    @game = Game.find(params[:game_id])
    @answer = Answer.new(answer_params)
    @answer.game = @game
    if @answer.save
      redirect_to game_path(@game)
    else
      render game_path(@game), status: :unprocessable_entity
    end
  end


  # def next_question
  #   prompt = "You are a quiz master. Speak in Italian. Ask me simple questions with a one word answer. Ask me one question at a time."
  #   response = @openai_client.chat(
  #     parameters: {
  #       model: "gpt-3.5-turbo",
  #       messages: [{ role: "user", content: prompt}],
  #       temperature:  0.7,
  #     }
  #   )

  #   # Extract the generated text from the response
  #   @generated_text = response.dig("choices", 0, "message", "content")

  #   # Return the generated text
  #   # render plain: generated_text
  # end

  private

  def game_params
    params.require(:game).permit(:nickname, :user_id)
  end

  def answer_params
    params.require(:answer).permit(:content, :game_id)
  end
end
