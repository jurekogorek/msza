class Ability
  include CanCan::Ability

  def initialize(osoba)
  

    #    can :read, Aktualnosc do |akt|
    #      akt.grupy.where(:id=>Grupa.wszyscy)
    #    end
    can :read, Miejsce
    can :read, Kraj
    can :read, Grupa
    can :read, Osoba
    can :read, Termin


    if osoba.try(:admin?)
      can :manage, :all   
    elsif osoba #USER JEST ZALOGOWANY
      can :edit, Grupa do |g|
        osoba.grupy.exists?(g)
      end
      can :update, Grupa do |g|
        osoba.grupy.exists?(g)
      end
      can :new, Miejsce
      can :manage, Miejsce do |m|
        osoba.grupy.exists?(m.grupy)
      end
      can :new, Termin
      can :manage, Termin do |t|
        osoba.grupy.exists?(t.try(:miejsce).try(:grupy))
      end

    end
  end
end