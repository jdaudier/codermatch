class UsersHaveLevels < ActiveRecord::Migration
  def up
    add_column :users, :level, :string
  end

  def down
    remove_column :users, :level
  end
end

