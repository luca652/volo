class CreateResources < ActiveRecord::Migration[7.0]
  def change
    create_table :resources do |t|
      t.string :title
      t.string :category
      t.string :comment
      t.string :picture_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
