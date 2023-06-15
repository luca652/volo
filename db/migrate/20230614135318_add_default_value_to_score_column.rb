class AddDefaultValueToScoreColumn < ActiveRecord::Migration[7.0]
  def change
      change_column_default :games, :score, 0
  end
end
