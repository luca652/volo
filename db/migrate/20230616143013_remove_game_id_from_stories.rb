class RemoveGameIdFromStories < ActiveRecord::Migration[7.0]
  def change
    remove_column :stories, :game_id
  end
end
