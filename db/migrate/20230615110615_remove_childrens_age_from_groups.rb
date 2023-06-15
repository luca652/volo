class RemoveChildrensAgeFromGroups < ActiveRecord::Migration[7.0]
  def change
    remove_column :groups, :max_age, :integer
    remove_column :groups, :min_age, :integer
  end
end
