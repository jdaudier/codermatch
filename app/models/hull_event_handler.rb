module HullEventHandler

  def self.handle event, request
    if event && event['eventName'] == 'create' && event['objectType'] == 'activity' && event['data']['object']['type'] == 'comment'
      target = event['data']['target'] rescue nil
      if target && target['uid'] =~ /user\//
        # send email from here...
        user_login = target['uid'].split("/")[1]
        recipient = User.where(login: user_login).first
        if user_login
          commenter   = User.where(login: event['data']['actor']['login']).first rescue nil
          content     = event['data']['object']['description'] rescue nil
          Notifications.delay.new_comment(recipient, commenter, content)
        end
      end
    end
  end
end