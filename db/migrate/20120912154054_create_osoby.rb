class CreateOsoby < ActiveRecord::Migration
  def change
    create_table :osoby do |t|
      t.string :nazwisko
      t.string :email
      t.string :password_digest
      t.string :stanowisko

      t.timestamps
    end
  end
end
