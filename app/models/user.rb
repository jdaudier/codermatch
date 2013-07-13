class User < ActiveRecord::Base
  LEVELS = ['Advanced', 'Intermediate', 'Beginner']

  attr_accessible :language_id, :language, :level, :zipcode, :firstname, :lastname
  belongs_to :language
end

