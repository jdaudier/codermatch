class User < ActiveRecord::Base
  LEVELS = ['Beginner', 'Intermediate', 'Advanced']

  attr_accessible :language_id, :language, :level, :zipcode, :firstname, :lastname

  belongs_to :language
  has_many :matches

  def self.from_hull_user hull_user_id
    hull_user = Hull.get(hull_user_id)
    github_user = hull_user['identities'].select { |i| i['provider'] == 'github' }.first
    User.find_or_create_by_firstname_and_lastname(hull_user['name'], github_user['login'])
  end

end

