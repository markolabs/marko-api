class SessionObserver < ActiveRecord::Observer
  include Mixpanel::Helper
  
  def after_create(session)
    mixpanel.track "Session Created", {
      distinct_id: session.user_id,
      device_id: session.device_id
    }
  end

  def after_destroy(session)
    mixpanel.track "Session Destroyed", {
      distinct_id: session.user_id,
      device_id: session.device_id
    }
  end
end
