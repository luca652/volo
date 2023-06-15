class GamesController < ApplicationController

  def new_game
    @game = Game.new
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
    @answer = Answer.new
    @answers = Answer.where(game_id: @game.id)
    @questions = Question.where(game_id: @game.id)
  end

  def start_game
    @openai_client = OpenAI::Client.new
    prompt = "Ask me one question. Address me using my #{@game.nickname}."
    response = @openai_client.chat(parameters: { model: "gpt-3.5-turbo", messages: [{ role: "user", content: prompt }],
                                                 temperature: 0.7 })
    text = response.dig("choices", 0, "message", "content")
    @question = Question.create!(game_id: @game.id, content: text)

  end

  def answer
    @game = Game.find(params[:game_id])
    @answer = Answer.new(answer_params)
    @answer.game = @game
    if @answer.save
      redirect_to game_path(@game)
      next_question(@answer.content)
    else
      render game_path(@game), status: :unprocessable_entity
    end
  end

  def next_question(prompt)
    @openai_client = OpenAI::Client.new
    response = @openai_client.chat(
      parameters: { model: "gpt-3.5-turbo", messages: [{ role: "user", content: prompt}],
                    temperature: 0.7 }
    )
    # Extract the generated text from the response
    text = response.dig("choices", 0, "message", "content")
    @next_question = Question.create!(game_id: @game.id, content: text)
  end

  private

  def game_params
    params.require(:game).permit(:nickname, :user_id)
  end

  def answer_params
    params.require(:answer).permit(:content, :game_id)
  end
end
