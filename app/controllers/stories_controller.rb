class StoriesController < ApplicationController

  def index
    @prompt = Prompt.new
  end

  def show
    @story = Story.find(params[:id])
  end

  def create_prompt
    @user = current_user
    @prompt = Prompt.new(prompt_params)
    @prompt.user = @user
    if @prompt.save
      @openai_client = OpenAI::Client.new
      request = "Tell me a brief story in Italian. The protagonist is #{@prompt.protagonist},
      and the story is set in #{@prompt.setting}. The protagonistwants to #{@prompt.goal}.
      His mortal enemy is #{@prompt.enemy}, and his favorite food is #{@prompt.food}"
      response = @openai_client.chat(parameters: { model: "gpt-3.5-turbo", messages: [{ role: "user", content: request }],
                                                    temperature: 0.7 })
      generated_story = response.dig("choices", 0, "message", "content")
      @story = Story.create!(game_id: @game.id, content: generated_story)
      redirect_to story_path(@story)
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def game_params
    params.require(:game).permit(:nickname, :user_id)
  end

  def prompt_params
    params.require(:prompt).permit(:protagonist, :goal, :weapon, :setting, :food, :enemy, :game_id)
  end

end
