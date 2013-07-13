class ChangeLevelFormatInUser < ActiveRecord::Migration
  def change
    change_column :users, :level, :string
  end
end
