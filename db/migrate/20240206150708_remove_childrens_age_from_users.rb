class RemoveChildrensAgeFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :childrens_age
  end
end
