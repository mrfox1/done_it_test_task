# include fcm gem for firebase cloud messaging
require 'fcm'

module Notifications
  class AndroidNotifications
    def initialize(auth_key)
      @client ||= FCM.new(auth_key)
    end

    def send_notification(message)
      #test ids
      registration_ids = ["fuOeAA-fPwI:APA91bFiUr7nN7g"]
      response = @client.send(registration_ids, message)
      p response
    end
  end
end