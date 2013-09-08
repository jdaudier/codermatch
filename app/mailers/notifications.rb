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

  def remotable_notify(recipient, new_buddy, new_buddy_language)
    @recipient = recipient
    @new_buddy = new_buddy
    @new_buddy_language = new_buddy_language
    subject = "There is a new coder who you might be able to pair with"
    mail to: recipient.email, :subject => subject
  end

  def contact_pair(sender, recipient_email)
    @recipient_email = recipient_email
    @sender = sender
    # @sender_language = sender_language
    subject = "#{sender} wants to pair program with you!"

    mail to: recipient_email, :subject => subject
    
  end
end
