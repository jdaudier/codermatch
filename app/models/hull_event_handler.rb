module HullEventHandler

  def self.handle event, request
    if event && event['eventName'] == 'create' && event['objectType'] == 'activity' && event['data']['object']['type'] == 'comment'
      target = event['data']['target'] rescue nil
      if target && target['uid'] =~ /user\//
        # send email from here...
        user_login = target['uid'].split("/")[1]

        recipient = User.where(login: user_login).first

        if user
          actor_name  = event['data']['actor']['name'] rescue nil
          content     = event['data']['object']['description'] rescue nil
          # sending email from here 
          Notifications.new_comment(recipient, actor_name, content)
          Rails.logger.info "--------------------------------"
          Rails.logger.info "Sending email to #{recipient.email}"
          Rails.logger.info "Body: #{actor_name} just wrote a comment on your profile" 
          Rails.logger.info "here is what she/he said : \n#{content}"
        end
      end
    end
  end
end