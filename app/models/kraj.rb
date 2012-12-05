class Kraj < ActiveRecord::Base
  attr_accessible :nazwa
  has_many :miejsca
end
