class DropTableLevel < ActiveRecord::Migration
  def up
  	drop_table :levels
  end
end
