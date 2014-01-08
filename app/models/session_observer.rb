class SessionObserver < ActiveRecord::Observer
  def after_create(session)
    Thread.new do
      $mixpanel.track session.user_id, "Session Created", {
        device_id: session.device_id
      }
    end
  end

  def after_destroy(session)
    Thread.new do
      $mixpanel.track session.user_id, "Session Destroyed", {
        device_id: session.device_id
      }
    end
  end
end
