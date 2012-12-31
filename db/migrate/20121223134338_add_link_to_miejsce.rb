class AddLinkToMiejsce < ActiveRecord::Migration
  def change
    add_column :miejsca, :link, :string
  end
end
