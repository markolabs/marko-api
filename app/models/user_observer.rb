class UserObserver < ActiveRecord::Observer
  include Mixpanel::Helper

  def after_create(user)
    mixpanel.track "User Created", {
      distinct_id: user.id
    }
  end
end
