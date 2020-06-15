module Notifications
  class AndroidNotifications
    attr_accessor :registrations_ids, :data

    def initialize(app_name, auth_key)
      @ids = registrations_ids
      @app = Rpush::Gcm::App.new
      @app.name = app_name
      @app.auth_key = auth_key
      @app.connection = 1
      @app.save!
    end

    def send_notification
      n = Rpush::Gcm::Notification.new
      n.app = @app
      n.registration_ids = @ids
      n.data = data
      n.save!
    end
  end
end