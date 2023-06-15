class ChangeStoriesToPrompts < ActiveRecord::Migration[7.0]
  def change
    rename_table :stories, :prompts
  end
end
