class User < ActiveRecord::Base
  LEVELS = ['Beginner', 'Intermediate', 'Advanced']

  attr_accessible :language_id, :language, :level, :zipcode, :firstname, :lastname, :email, :name, :login, :remotable, :notify

  #Enforces presence of 5-digit zipcode on signup form
  # validates_presence_of :zipcode, :on => :update
  validates_length_of :zipcode, :is => 5, :allow_blank => false

  belongs_to :language
  def self.from_hull_user hull_user_id
    hull_user = Hull.get(hull_user_id)
    github_user = hull_user['identities'].select { |i| i['provider'] == 'github' }.first
    user = User.find_or_create_by_login(github_user['login'])
    user.update_attributes({ email: hull_user['email'], name: hull_user['name'] })
    user
  end

  geocoded_by :zipcode
  before_save :geocoder_with_maps

  acts_as_gmappable

  def geocoder_with_maps
    if self.zipcode?
      gmap_uri = URI.escape("https://maps.googleapis.com/maps/api/geocode/json?address=#{self.zipcode}&sensor=false")
      gmap_webpage = open(gmap_uri).read
      gmap_hash = JSON.parse(gmap_webpage)
      self.latitude = gmap_hash["results"].first["geometry"]["location"]["lat"].to_f
      self.longitude = gmap_hash["results"].first["geometry"]["location"]["lng"].to_f
    end
  end

  def gmaps4rails_address
   #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.zipcode}"
  end

  def gmaps4rails_infowindow
    # if @current_user
      # "#{self.login}"

    # end
      html = ""
      user_zipcode = User.where(login: self.login).first.zipcode
      # if @current_user.present?
        User.where(zipcode: user_zipcode).each do |u|
          html << "<h5>#{u.name}</h5>"
        end
        html
      # end
  end
end
