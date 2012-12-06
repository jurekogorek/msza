class Dzien < ActiveRecord::Base
  attr_accessible :nazwa
  has_many :teminy
end
