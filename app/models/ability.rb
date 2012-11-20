class Ability
  include CanCan::Ability

  def initialize(osoba)
  

#    can :read, Aktualnosc do |akt|
#      akt.grupy.where(:id=>Grupa.wszyscy)
#    end
can :manage, :all 
 

    if osoba.try(:admin?)
      can :manage, :all   
    elsif osoba #USER JEST ZALOGOWANY

    end
  end
end