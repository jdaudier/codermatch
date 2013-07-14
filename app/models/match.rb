class Match < ActiveRecord::Base

  attr_accessible :repo, :languages, :zipcode
  belongs_to :user
  
  
end