class User < ActiveRecord::Base
  attr_accessible :language, :level, :zipcode, :firstname, :lastname
  has_many :levels
  has_many :languages, through: :levels
end
