class ModifyGrupa < ActiveRecord::Migration
  def up
     create_table :grupy_miejsca,:id=>false do |t|
      t.integer :miejsce_id
      t.integer :grupa_id
    end
    add_attachment :grupy, :avatar
    change_column :grupy, :opis, :text
  end

  def down
  end
end
