class CreateMiejsca < ActiveRecord::Migration
  def change
    create_table :miejsca do |t|
      t.string :nazwa
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps

      t.timestamps
    end
  end
end
