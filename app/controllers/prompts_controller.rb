class PromptsController < ApplicationController

  def create
    @prompt = Prompt.new(prompt_params)

    if @prompt.save

    end
  end

  private

  def prompt_params
    params.require(:prompt).permit(:protagonist, :language, :weapon, :setting, :food, :enemy, :user_id)
  end
end
