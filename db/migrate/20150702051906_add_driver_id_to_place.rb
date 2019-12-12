class AddDriverIdToPlace < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :driver_id, :integer
  end
end
