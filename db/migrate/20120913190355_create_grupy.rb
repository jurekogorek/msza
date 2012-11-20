class CreateGrupy < ActiveRecord::Migration
  def change
    create_table :grupy do |t|
      t.string :nazwa
      t.string :opis

      t.timestamps
    end
  end
end
