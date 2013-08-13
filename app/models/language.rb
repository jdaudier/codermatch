class Language < ActiveRecord::Base
  attr_accessible :language
  has_many :users
end
