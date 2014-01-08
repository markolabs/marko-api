class PingObserver < ActiveRecord::Observer
  def after_create(ping)
    $mixpanel.track "Location Pinged", {
      distinct_id: ping.user_id, 
      device_id: ping.device_id, 
      background: ping.background,
      latitude: ping.latitude,
      longitude: ping.longitude
    }
  end
end
