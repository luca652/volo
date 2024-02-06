class DeleteChildrensAgeFromGroups < ActiveRecord::Migration[7.0]
  def change
    remove_column :groups, :childrens_age
  end
end
