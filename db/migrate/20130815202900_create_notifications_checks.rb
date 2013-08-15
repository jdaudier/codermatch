class CreateNotificationsChecks < ActiveRecord::Migration
  def change
    create_table :notifications_checks do |t|

      t.timestamps
      t.integer :recipient_id
      t.integer :new_buddy_id

    end
  end
end
