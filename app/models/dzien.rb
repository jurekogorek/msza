class Dzien < ActiveRecord::Base
  attr_accessible :nazwa
  has_many :teminy


  def self.dzisiaj
    d=Time.now.wday
    d=7 if d==0
    d
  end

  def self.jutro
    Time.now.wday+1
  end
end
