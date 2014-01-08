class DeviceObserver < ActiveRecord::Observer  
  def after_create(device)
    Thread.new do
      $mixpanel.track device.user_id, "Device Registered", {
        device_id: device.id
      }
    end
  end
end
