class RemoveAccessibilityFromEvents < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :accessibility
  end
end
