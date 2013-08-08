class AddNotifyToUser < ActiveRecord::Migration
  def change
    add_column :users, :notify, :boolean
  end
end
