class ContactController < ApplicationController

 def send_pair_request
  @sender = @current_user
  @recipient_email = params[:recipient]
  Notifications.delay.contact_pair(@sender, @recipient_email)
  
  redirect_to "/"
 end
  
end
