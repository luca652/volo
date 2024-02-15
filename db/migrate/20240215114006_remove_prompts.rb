class RemovePrompts < ActiveRecord::Migration[7.0]
  def change
    drop_table :prompts
  end
end
