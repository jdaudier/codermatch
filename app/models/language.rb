class Language < ActiveRecord::Base
  attr_accessible :language
  has_many :levels
  has_many :users, through: :levels
end
