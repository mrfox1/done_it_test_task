class AndroidNotificationsWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(notification)
    Notifications::AndroidNotifications.new("AIzaSyDkux2sfjfwbWZyDRDhIY_eHUqa7FVScpA").
        send_notification(message)
  end
end