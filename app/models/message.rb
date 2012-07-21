class Message < ActiveRecord::Base

  Pusher.app_id = '24390'
  Pusher.key = '5da75bd64128b88d32b8'
  Pusher.secret = 'f43743c6be287c61ad69'

  after_create :send_to_pusher

  def send_to_pusher
    logger.info "Hi?"
    Pusher['michat'].trigger("message:create",self.to_json)  
  end

end
