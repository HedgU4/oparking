class DeleteImageUploadFromParking < ActiveRecord::Migration[5.1]
  def change
    remove_column :parkings, :schema, :string
  end
end
