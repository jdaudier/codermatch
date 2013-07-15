module ApplicationHelper
	def gravatar(user, size=100)
  	default = 'http://codermatch.herokuapp.com/assets/stewie.gif'
    gravatar_id = Digest::MD5.hexdigest(user.email)
    "//gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=#{default}"
  end

  def image_url(source)
  	URI.join(root_url, image_path(source))
	end
end
