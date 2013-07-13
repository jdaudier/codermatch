class ChangeLevelFormatInLevel < ActiveRecord::Migration
  def change
    change_column :levels, :level, :string
  end
end
