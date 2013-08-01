class AddRemotableColumntoUsers < ActiveRecord::Migration
  def change
    add_column :users, :remotable, :boolean
  end
end
