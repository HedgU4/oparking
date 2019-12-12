class CreateDrivers < ActiveRecord::Migration[5.1]
  def change
    create_table :drivers do |t|
      t.string :car_number
      t.string :car
      t.string :name

      t.timestamps
    end
  end
end
