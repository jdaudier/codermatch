class NotificationsCheck < ActiveRecord::Base
  attr_accessible :new_buddy_id, :recipient_id
  belongs_to :new_buddy, :class_name => 'User'
  belongs_to :recipient, :class_name => 'User'

end
