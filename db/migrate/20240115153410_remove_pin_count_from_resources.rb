class RemovePinCountFromResources < ActiveRecord::Migration[7.0]
  def change
    remove_column :resources, :pin_count
  end
end
