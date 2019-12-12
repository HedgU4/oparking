class AddSchemaToParkings < ActiveRecord::Migration[5.1]
  def change
    add_column :parkings, :schema, :string
  end
end
