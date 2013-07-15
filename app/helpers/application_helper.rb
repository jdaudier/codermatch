module ApplicationHelper
	def gravatar(user, size=100)
  	default='https://dl.dropboxusercontent.com/u/125982/codermatch/stewie.gif'
    gravatar_id = Digest::MD5.hexdigest(user.email)
    "//gravatar.com/avatar/#{user.gravatar_id}.png?s=#{size}&d=#{default}"
  end
end
