class AddChildrensAgeToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :childrens_age, :string, array: true, default: []
  end
end
