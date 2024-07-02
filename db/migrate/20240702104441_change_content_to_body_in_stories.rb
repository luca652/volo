class ChangeContentToBodyInStories < ActiveRecord::Migration[7.0]
  def change
    rename_column :stories, :content, :body
  end
end
