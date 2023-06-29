class RemoveGoalFromPrompts < ActiveRecord::Migration[7.0]
  def change
    remove_column :prompts, :goal
  end
end
