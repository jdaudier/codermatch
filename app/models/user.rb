class User < ActiveRecord::Base
  LEVELS = ['Beginner', 'Intermediate', 'Advanced']

  attr_accessible :language_id, :language, :level, :zipcode, :firstname, :lastname, :email, :name, :login

  belongs_to :language
  def self.from_hull_user hull_user_id
    hull_user = Hull.get(hull_user_id)
    github_user = hull_user['identities'].select { |i| i['provider'] == 'github' }.first
    user = User.find_or_create_by_login(github_user['login'])
    user.update_attributes({ email: hull_user['email'], name: hull_user['name'] })
    user
  end

  def picture(size=120, default='blank')
    gravatar_id = Digest::MD5.hexdigest(self.email)
    "//gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=#{default}"
  end
end
