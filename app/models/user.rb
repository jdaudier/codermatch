class User < ActiveRecord::Base
  LEVELS = ['Beginner', 'Intermediate', 'Advanced']

  attr_accessible :language_id, :language, :level, :zipcode, :firstname, :lastname
  belongs_to :language


  def self.from_hull_user hull_user_id
    hull_user = Hull.get(hull_user_id)
    user = User.find_or_create_by_lastname(hull_user['name'])
    hull_user['your_user'] = user
    hull_user
  end

end

