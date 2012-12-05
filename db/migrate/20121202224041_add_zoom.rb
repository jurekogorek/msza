class AddZoom < ActiveRecord::Migration
  def up
    add_column :miejsca, :zoom, :integer
  end

  def down
  end
end
