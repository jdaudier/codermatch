class NewDeveloperArbiter #< Valuable
  attr_accessor :firstname, :my_language, :my_level, :pair_language, :pair_level, :zipcode

  def initialize(atts = {})
    self.firstname = atts[:firstname]
    self.my_language = atts[:my_language]
    self.my_level = atts[:my_level]
    self.pair_language = atts[:pair_language]
    self.pair_level = atts[:pair_level]
    self.zipcode = atts[:zipcode]
  end

  def language
    Language.find_by_language(self.my_language)
  end

  def process
    User.create(:firstname => self.firstname, :zipcode => self.zipcode, :language => self.language, :level => self.my_level)
    # any other sign-up steps
  end

  def target
    "/coder_search?language=#{pair_language}&level=#{pair_level}&zipcode=#{zipcode}"
  end
end
