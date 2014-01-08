class UserObserver < ActiveRecord::Observer
  def after_create(user)
    $mixpanel.track user.id, "User Created"

    $mixpanel.people.set user.id, {
      "$first_name" => user.first_name,
      "$last_name" => user.first_name,
      "Signup" => user.created_at,
      "Username" => user.username,
      "Facebook ID" => user.fb_user_id
    }
  end

  def after_save(user)
    $mixpanel.people.set user.id, {
      "$first_name" => user.first_name,
      "$last_name" => user.first_name,
      "Signup" => user.created_at,
      "Username" => user.username,
      "Facebook ID" => user.fb_user_id
    }
  end
end
