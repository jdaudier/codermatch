class User < ActiveRecord::Base
  attr_accessible :language, :level, :zipcode
  has_many :levels
  has_many :languages, through: :levels
end
