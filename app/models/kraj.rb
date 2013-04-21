class Kraj < ActiveRecord::Base
  attr_accessible :nazwa
  has_many :miejsca,:order=>:nazwa

	def self.wszystkie
		Kraj.order('nazwa').includes(:miejsca=>[{:terminy=>[:dzien]},:grupy])
	end
end
