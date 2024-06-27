class StoriesController < ApplicationController

  def new
    @prompt = Prompt.new
    @user = current_user
  end

  def create
    @prompt = Prompt.new(prompt_params)
    @user = current_user

    if @prompt.valid?
      story_generator = StoryGenerator.new
      title_and_story = story_generator.generate_story(@prompt)

      begin
        @story = Story.create!(
          user_id: @user.id,
          title: title_and_story[:title],
          content: title_and_story[:story]
        )

        redirect_to story_path(@story)
      rescue ActiveRecord::RecordInvalid => e
        flash.now[:alert] = "There was an issue creating your story. Please try again."
        render :new
      end
    else
      render :new
    end
  end

  def show
    @story = Story.find(params[:id])
  end

  private

  def prompt_params
    params.require(:prompt).permit(:protagonist, :language, :weapon, :setting, :food, :enemy, :user_id)
  end
end
