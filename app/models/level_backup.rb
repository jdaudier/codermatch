class Level < ActiveRecord::Base
  attr_accessible :level
  belongs_to :user
  belongs_to :language
end
