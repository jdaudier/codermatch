module HullEventHandler

  def self.handle event, request
    if event && event['eventName'] == 'create' && event['objectType'] == 'activity' && event['data']['object']['type'] == 'comment'
      target = event['data']['target'] rescue nil
      if target && target['uid'] =~ /user\//
        # send email from here...
        user_login = target['uid'].split("/")[1]
        recipient = User.where(login: user_login).first
        if user_login
          commenter   = event['data']['actor']['name'] rescue nil
          content     = event['data']['object']['description'] rescue nil
          Notifications.new_comment(recipient, commenter, content).deliver
        end
      end
    end
  end
end