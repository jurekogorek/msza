# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
 ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
   inflect.irregular 'aktualnosc', 'aktualnosci'
   inflect.irregular 'grupa', 'grupy'
   inflect.irregular 'osoba', 'osoby'
   inflect.irregular 'obrazek', 'obrazki'
   inflect.irregular 'glowna', 'glowne'
   inflect.irregular 'klient', 'klienci'
   inflect.irregular 'status', 'statusy'
   inflect.irregular 'produkt', 'produkty'
   inflect.irregular 'projekt', 'projekty'
   inflect.uncountable %w( portfolio kontakt)
 end
#
# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.acronym 'RESTful'
# end
