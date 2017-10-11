class CreateCampingTrip < ActiveRecord::Migration[5.1]
  def change
    create_table :campingtrip do |t|
      t.string :park_name
      t.string :state
      t.integer :site_number
      t.string :firepit
      t.string :waterfront
      t.string :shaded
      t.string :dog_friendly
      t.string :cabins
      t.string :toilet_type
      t.text :description
      t.string :other_good_sites
      t.string :waterpump
      t.string :water_taste
      t.text :added_notes
      t.integer :user_id
    end
  end
end
