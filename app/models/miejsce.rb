class Miejsce < ActiveRecord::Base
  attr_accessible :gmaps, :latitude, :longitude, :nazwa, :zoom,:miasto, :kod, :ulica, :kraj_id,:kraj,:terminy_attributes
  acts_as_gmappable

  belongs_to :kraj
  has_many :terminy, :order=>"dzien_id"

  accepts_nested_attributes_for :terminy, :allow_destroy => true

  def gmaps4rails_address

  end

#  def gmaps4rails_marker_picture
#  {
#   "picture" => "rails.png",
#   "width" => 40,
#   "height" => 40,
#   "marker_anchor" => [ 5, 10],
#  }
#  end
  def gmaps4rails_title
      "#{nazwa}"
  end


  def adres
    "#{ulica}, #{kod} #{miasto}"
  end
end
