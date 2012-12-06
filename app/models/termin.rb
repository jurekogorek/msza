class Termin < ActiveRecord::Base
  attr_accessible :dzien_id, :godzina, :komentarz,:miejsce_id, :miejsce
  belongs_to :miejsce
  belongs_to :dzien
end
