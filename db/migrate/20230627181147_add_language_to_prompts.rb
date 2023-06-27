class AddLanguageToPrompts < ActiveRecord::Migration[7.0]
  def change
    add_column :prompts, :language, :string
  end
end
