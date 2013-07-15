module ApplicationHelper
	def gravatar(user, size=100)
  	default = image_tag('stewie.gif')
    gravatar_id = Digest::MD5.hexdigest(user.email)
    "//gravatar.com/avatar/#{user.gravatar_id}.png?s=#{size}&d=#{default}"
  end
end
