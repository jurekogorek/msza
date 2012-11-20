# encoding: utf-8
class Osoba < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :nazwisko, :password, :password_confirmation, :stanowisko, :avatar,:grupa_ids, :tymczasowe_haslo, :imie, :instytucja, :opis
  validates     :email, :presence => true, :on => :create
  validates     :email, :uniqueness => {:message => :email_juz_aktywowany}, :on => :create
  validates     :nazwisko, :presence => true
  validates_length_of       :email, :within => 4..45, :allow_blank => true
  validates_format_of       :email, :with => /\A([^@\s]+[\d\w])@((?:[\-a-z0-9]{2,}\.)+[a-z]{2,})\Z/i, :allow_blank => true

  validates :nazwisko, :length => { :minimum => 3 }
  validates :nazwisko, :format => /\A([ \-a-zA-ZąćęłńóśźżĄĆĘŁŃÓŚŹŻűüőö])+\Z/i

  validates :tymczasowe_haslo, :presence=>true, :on=>:create

  has_many :tasks,:foreign_key=>:przypisany_do,:class_name=>"Task"

  has_and_belongs_to_many :grupy
#  has_and_belongs_to_many :watki, :join_table => 'rozmowcy'

  has_attached_file :avatar, :styles => { :medium => "100x100>", :thumb => "30x30>" }

  before_validation do |osoba|
   if !osoba.tymczasowe_haslo.try(:blank?) and osoba.password.blank? and osoba.password_confirmation.blank?
     osoba.password = osoba.password_confirmation = osoba.tymczasowe_haslo
   end
  end

  def moje_grupy
    if self.admin_moderator?
      Grupa.where(:docelowa=>true).order("kolejnosc ASC")
    else
      @r ||= self.grupy + [Grupa.wszyscy]
    end
  end

  def grupa_docelowa
    self.grupy.where("docelowa IS ? and id <> ?",true, Grupa.wszyscy.id).first
  end

  def tymczasowe_haslo_ustawione?
    false
#    !self.tymczasowe_haslo.blank?
  end

  def generuj_tymczasowe_haslo
    self.tymczasowe_haslo = SecureRandom.urlsafe_base64(6)    
  end

  def admin?
     self.grupy.exists?(Grupa.find_by_nazwa('Administratorzy'))
  end

  def moderator?
    self.grupy.exists? Grupa.find_by_nazwa('Moderatorzy')
  end

  def admin_moderator?
    self.admin? or self.moderator?
  end

  def wyczysc_tymczasowe_haslo
    self.tymczasowe_haslo = nil
  end


  def self.osoby
    a=['']
    a+Osoba.order(:nazwisko).map{ |o| [o.nazwisko,o.id] }
  end
  
end
