class AddDefaultValueToRequestsDeclined < ActiveRecord::Migration[7.0]
  def change
    change_column_default :requests, :declined, false
  end
end
