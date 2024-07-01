class RecreatePrompts < ActiveRecord::Migration[7.0]
  def change
    create_table :prompts do |t|
      t.string :protagonist
      t.string :weapon
      t.text :setting
      t.string :enemy
      t.string :food
      t.string :language
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
