class DeviceObserver < ActiveRecord::Observer
  include Mixpanel::Helper
  
  def after_create(device)
    mixpanel.track "Device Registered", {
      distinct_id: device.user_id, 
      device_id: device.id
    }
  end
end
