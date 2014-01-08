class DeviceObserver < ActiveRecord::Observer  
  def after_create(device)
    $mixpanel.track device.user_id, "Device Registered", {
      device_id: device.id
    }
  end
end
