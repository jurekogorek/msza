class Miejsce < ActiveRecord::Base
  attr_accessible :gmaps, :latitude, :longitude,:grupa_id,:grupa, :nazwa, :zoom,:miasto, :kod, :ulica, :kraj_id,:kraj,:terminy_attributes
  acts_as_gmappable

  belongs_to :kraj
  has_and_belongs_to_many :grupy
  has_many :terminy, :order=>"dzien_id"

  accepts_nested_attributes_for :terminy, :allow_destroy => true

  def gmaps4rails_address

  end

  def gmaps4rails_marker_picture
  {
   "picture" =>  self.try(:grupa).try(:avatar).try(:url,:thumb),
   "width" => 30,
   "height" => 30,
   "marker_anchor" => [ 15, 30],
  }
  end
  def gmaps4rails_title
      "#{nazwa}"
  end


  def ustaw_grupy(user)
    self.grupy<<user.grupy
  end

  def grupa
    grupy.try(:first)
  end

  def adres
    "#{ulica}, #{kod} #{miasto}"
  end

  def self.w_dniu_dla_kraju(dzien,kraj)
    Miejsce.joins(:terminy).where(["terminy.dzien_id=? and kraj_id=?",dzien,kraj.id]).includes(:grupy,:kraj,:terminy=>[:dzien]).uniq
  end
  def self.w_dniu_dla_grupy(dzien,grupa)
    Miejsce.joins(:terminy,:grupy).where(["terminy.dzien_id=? and grupy.id=?",dzien,grupa.id]).includes(:kraj,:grupy,:terminy=>[:dzien]).uniq
  end
  def self.w_dniu(dzien)
    Miejsce.joins(:terminy).where(["terminy.dzien_id=?",dzien]).includes(:grupy,:kraj,:terminy=>[:dzien]).uniq
  end
end
