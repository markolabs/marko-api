class SessionObserver < ActiveRecord::Observer
  def after_create(session)
    $mixpanel.track session.user_id, "Session Created", {
      device_id: session.device_id
    }
  end

  def after_destroy(session)
    $mixpanel.track session.user_id, "Session Destroyed", {
      device_id: session.device_id
    }
  end
end
