class AddFieldsToMiejsce < ActiveRecord::Migration
  def change
    add_column :miejsca, :miasto, :string
    add_column :miejsca, :kod, :string
    add_column :miejsca, :ulica, :string
    add_column :miejsca, :kraj_id, :integer

   create_table :kraje do |t|
      t.string :nazwa
      t.timestamps
    end
  end
end
