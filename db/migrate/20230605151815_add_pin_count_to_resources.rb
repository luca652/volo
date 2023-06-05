class AddPinCountToResources < ActiveRecord::Migration[7.0]
  def change
    add_column :resources, :pin_count, :integer, default: 0
  end
end
