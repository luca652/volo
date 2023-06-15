class AddChildreAgeToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :children_age, :string
  end
end
