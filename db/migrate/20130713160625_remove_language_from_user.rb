class RemoveLanguageFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :language
  end

  def down
    add_column :users, :language, :string
  end
end
