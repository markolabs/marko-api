class PingObserver < ActiveRecord::Observer
  def after_create(ping)
    Thread.new do
      $mixpanel.track ping.user_id, "Location Pinged", {
        device_id: ping.device_id, 
        background: ping.background,
        latitude: ping.latitude,
        longitude: ping.longitude
      }
    end
  end
end
