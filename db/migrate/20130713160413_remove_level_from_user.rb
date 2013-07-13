class RemoveLevelFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :level
  end

  def down
    add_column :users, :level, :string
  end
end
