# This for use with our form

class NewDeveloperArbiter #< Valuable
  attr_accessor :firstname, :my_language, :my_level, :pair_language, :pair_level, :zipcode, :lastname, :remotable

  def initialize(atts = {}, current_user)
    # Current user is passed in here from the pages controller and we set it as a @current_user instance variable to use in the views
    # Sets additional info about new user
    # Self here reference to an instance of the current user, not the class
    # This sets the initial stage but isn't saved till it's processed (see method below)
    @current_user = current_user
    self.firstname = atts[:firstname]
    self.lastname = atts[:lastname]
    self.my_language = atts[:my_language]
    self.my_level = atts[:my_level]
    self.pair_language = atts[:pair_language]
    self.pair_level = atts[:pair_level]
    self.zipcode = atts[:zipcode]

    if atts[:remote] == 'can'
      self.remotable = true
    else
      self.remotable = false
    end

  end

  def language
    Language.find_by_language(self.my_language)
  end

  def process
    # This will update and save to the User table

    #With validation, this method returns true if current_user is successfully updated(zipcode is proper and has 5 digits). Otherwise it returns false.
    @current_user.update_attributes({
      :zipcode => self.zipcode,
      :language => self.language, #This is plugged into the language method above
      :level => self.my_level,
      :remotable => self.remotable #This sets current_user's remotable to false when they click 'match me'. If they find nobody, they can come back and do zip code search.
    })
  end

  def search
    # This info is used for searching but not saved to the User table (except zipcode)
    Rails.application.routes.url_helpers.coder_search_path search_params
  end

protected
  def search_params
    {
      :language => pair_language,
      :level => pair_level,
      :zipcode => zipcode
    }
  end
end
