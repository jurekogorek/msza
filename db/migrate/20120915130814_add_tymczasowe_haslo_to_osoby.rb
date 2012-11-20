class AddTymczasoweHasloToOsoby < ActiveRecord::Migration
  def change
    add_column :osoby, :tymczasowe_haslo, :string, :null=>true, :default=>nil
  end
end
