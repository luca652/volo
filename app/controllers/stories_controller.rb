class StoriesController < ApplicationController

  def new
    @prompt_form = PromptForm.new
    @user = current_user
  end

  def create
    @prompt_form = PromptForm.new(prompt_form_params)
    @user = current_user

    if @prompt_form.valid?
      story_generator = StoryGenerator.new
      generated_story = story_generator.generate_story(@prompt_form)
      @story = Story.create(user_id: @user.id, title: generated_story.partition("#").first.strip,
      content: generated_story.partition("#").last.strip)
      redirect_to story_path(@story)
    else
      render :new
    end
  end

  def show
    @story = Story.find(params[:id])
  end

  private

  def prompt_form_params
    params.require(:prompt_form).permit(:protagonist, :language, :weapon, :setting, :food, :enemy, :user_id)
  end
end
