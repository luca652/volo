class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :number_of_children, :integer
    add_column :users, :childrens_age, :string
    add_column :users, :language, :string
    add_column :users, :location, :string
  end
end
