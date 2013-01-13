class Grupa < ActiveRecord::Base
  attr_accessible :nazwa, :opis,:przedstawiciel,:docelowa,:kolejnosc,:avatar
  has_and_belongs_to_many :osoby,:order=>:nazwisko
  has_and_belongs_to_many :aktualnosci
  has_and_belongs_to_many :watki
  has_and_belongs_to_many :galerie
  has_and_belongs_to_many  :miejsca,:order=>"kraj_id ASC"

  has_attached_file :avatar, :styles => { :medium => "100x100>", :thumb => "30x30>" }
  validates :nazwa, :presence=>true
  validates :nazwa, :length => { :in => 4..250 }

  def self.docelowe
    Grupa.where(:docelowa=>true).order("kolejnosc ASC").limit(4)
  end

  def self.docelowe_wszystkie
    @a ||= self.docelowe+Grupa.where(:nazwa=>"Wszyscy")
  end

  def self.wszyscy
    Grupa.where(:nazwa=>"Wszyscy").first
  end
end
