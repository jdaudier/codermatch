class Notifications < ActionMailer::Base
  helper :application
  default from: "hi@codermatch.me"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.new_comment.subject
  #
  def new_comment(recipient, commenter, comment_body)
    @commenter = commenter
    @body = comment_body
    @recipient = recipient
    subject = "You have a new comment from #{@commenter.name}"
    mail to: recipient.email, :subject => subject
  end

  def remotable_notify(recipient, new_buddies, recipient_language)
    @recipient = recipient
  
    @new_buddies = new_buddies
    @recipient_language = recipient_language
    subject = "There is a new coder who you might be able to pair with"
    mail to: recipient.email, :subject => subject
  end

  def send_notification_mailer

    User.joins(:language).where(
      :notify => true
      ).each do |user|
        @recipient = user
        @recipient_language = @recipient.language.language
        # The new_buddies hash will be populated with all users that meet criteria of @recipient that have registered since a week before
        @new_buddies = []

        User.joins(:language).where(
          :language_id => @recipient.language_id,
          :level => @recipient.level
          ).each do |new_buddy|

          @new_buddy = new_buddy
          @new_buddy_creation = @new_buddy.created_at
          @one_week_ago = 1.week.ago

          # prevents @recipient from getting themselves as a new buddy in the notifications email
          #Also, only chooses new buddies who were added to database in last week
          if @new_buddy != @recipient && @new_buddy_creation >= @one_week_ago  
            @new_buddies << @new_buddy
          end
        end
    
      #TEMPORARILY removing the .delay part to test
      Notifications.remotable_notify(@recipient, @new_buddies, @recipient_language).deliver

    end

  end
end
