class CreateOsobyGrupy < ActiveRecord::Migration
  def change
    create_table :grupy_osoby,:id=>false do |t|
      t.integer :osoba_id
      t.integer :grupa_id
    end
  end
end
