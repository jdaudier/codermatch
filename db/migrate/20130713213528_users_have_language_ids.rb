class UsersHaveLanguageIds < ActiveRecord::Migration
  def up
    add_column :users, :language_id, :integer
  end

  def down
    remove_column :users, :language_id
  end
end

