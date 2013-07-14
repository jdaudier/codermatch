require 'handlebars_assets'

Hull.configure do |config|

  # == Hull App Config
  # 
  config.app_id = '51e1038da824c2caa8000017'

  # == Hull App secret
  # This is required to enable all server side secure stuff.
  # 
  config.app_secret = ''

  # == Hull Org Url  
  config.org_url = 'https://f45280e3.hullapp.io'

  # == Authenticate Users
  config.authenticate_users = false

  # == Curent user name
  # The method/variable that contains the logged in user in your controllers.
  # If it is `current_user` or `@user`, then you can ignore this
  # config.current_user = Proc.new { current_user }
  
  # == User Custom Data
  # A hash of additional data you wish to send about your users.
  # You can provide either a method name which will be sent to the current
  # user object, or a Proc which will be passed the current user.
  # config.user_attributes = {
  #   :image  => :image,
  #   :email  => :email,
  #   :name   => Proc.new { |current_user| current_user.name.try(:upcase) }
  # }

  # == hull.js version
  config.js_url = "https://d3f5pyioow99x0.cloudfront.net/0.5.2/hull.js"

  HandlebarsAssets::Config.path_prefix = 'hull_components'

end