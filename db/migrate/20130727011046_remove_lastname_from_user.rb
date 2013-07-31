class RemoveLastnameFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :lastname
  end

  def down
    add_column :users, :lastname, :string
  end
end
