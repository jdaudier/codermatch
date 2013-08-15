class CreateNotificationsChecks < ActiveRecord::Migration
  def change
    create_table :notifications_checks do |t|

      t.timestamps
      t.string :recipient
      t.string :new_buddy

    end
  end
end
