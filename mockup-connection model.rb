class Connection < ActiveRecord::Base  
  attr_accessible :status, :message, :token
  has_one :sender, :class_name => "User"
  has_one :recipient, :class_name => "User"

  before_create :generate_token
  after_create :send_mail

  def generate_token
    self.token = SecureRandom.base64(15).tr('+/=lIO0', 'abc123')
  end

  def send_mail
    Notifications.send_connection(self.token, self.message)
  end

end