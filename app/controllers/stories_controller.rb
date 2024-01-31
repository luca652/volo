class StoriesController < ApplicationController

  def new
    @prompt = Prompt.new
    @user = current_user
    @prompt.user = @user
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
      request = "Tell me a story of maximum 250 words in #{@prompt.language}. The protagonist is #{@prompt.protagonist},
      and the story is set in #{@prompt.setting}. His mortal enemy is #{@prompt.enemy}, and his/her favorite food is #{@prompt.food}.
      Start with a title, something like 'Arturo e la foresta oscura'. Put a # at the end of the title."
      response = @openai_client.chat(parameters: { model: "gpt-3.5-turbo", messages: [{ role: "user", content: request }],
                                                   temperature: 0.7 })
      generated_story = response.dig("choices", 0, "message", "content")

      @story = Story.create!(user_id: @user.id, title: generated_story.partition("#").first.strip,
                             content: generated_story.partition("#").last.strip)
      redirect_to story_path(@story)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def prompt_params
    params.require(:prompt).permit(:protagonist, :language, :weapon, :setting, :food, :enemy, :game_id)
  end
end
