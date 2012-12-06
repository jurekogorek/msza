class CreateTerminy < ActiveRecord::Migration
  def change
    create_table :dni do |t|
        t.string :nazwa
    end
    Dzien.create(:nazwa=>'Pon',:id=>1)
    Dzien.create(:nazwa=>'Wto',:id=>2)
    Dzien.create(:nazwa=>'Sro',:id=>3)
    Dzien.create(:nazwa=>'Czw',:id=>4)
    Dzien.create(:nazwa=>'Pia',:id=>5)
    Dzien.create(:nazwa=>'Sob',:id=>6)
    Dzien.create(:nazwa=>'Nie',:id=>7)
    create_table :terminy do |t|
      t.string :dzien_id
      t.string :godzina
      t.string :komentarz
      t.integer :miejsce_id

      t.timestamps
    end
  end
end
