class RemoveLanguageFromPrompts < ActiveRecord::Migration[7.0]
  def change
    remove_column :prompts, :language
  end
end
