class CreateLines < ActiveRecord::Migration[5.1]
  def change
    create_table :lines do |t|
      t.string :code, limit:30
      t.string :itinerary
      t.string :company, limit:100
      t.string :terminal, limit:50
      t.string :map_id
      t.string :kml_filename, limit:20

      t.timestamps
    end
  end
end
