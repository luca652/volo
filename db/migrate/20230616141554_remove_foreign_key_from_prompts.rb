class RemoveForeignKeyFromPrompts < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :prompts, :games
  end
end
