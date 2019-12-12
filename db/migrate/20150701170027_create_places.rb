class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.integer :number
      t.integer :parking_id
      t.boolean :occupied

      t.timestamps
    end
  end
end
