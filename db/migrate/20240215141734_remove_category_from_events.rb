class RemoveCategoryFromEvents < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :category
  end
end
