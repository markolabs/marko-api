class UserObserver < ActiveRecord::Observer
  include Mixpanel::Helper

  def after_create(user)
    mixpanel.track "User Created", {
      distinct_id: user.id
    }

    mixpanel.track.people user.id, {
      "$first_name" => user.first_name,
      "$last_name" => user.first_name,
      "Signup" => user.created_at,
      "Username" => user.username,
      "Facebook ID" => user.fb_user_id
    }
  end

  def after_save(user)
    mixpanel.track.people user.id, {
      "$first_name" => user.first_name,
      "$last_name" => user.first_name,
      "Signup" => user.created_at,
      "Username" => user.username,
      "Facebook ID" => user.fb_user_id
    }
  end
end
