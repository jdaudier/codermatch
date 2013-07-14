class User < ActiveRecord::Base
  LEVELS = ['Beginner', 'Intermediate', 'Advanced']

  attr_accessible :language_id, :language, :level, :zipcode, :firstname, :lastname
  belongs_to :language


  def self.from_hull_user hull_user
    @current_user = User.find_or_create_by(:email => @hull_user['email']).first
  end

end

