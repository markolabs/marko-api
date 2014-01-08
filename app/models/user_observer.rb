class UserObserver < ActiveRecord::Observer
  def after_create(user)
    Thread.new do
      $mixpanel.track user.id, "User Created"
    end

    Thread.new do
      $mixpanel.people.set user.id, {
        "$first_name" => user.first_name,
        "$last_name" => user.first_name,
        "Signup" => user.created_at,
        "Username" => user.username,
        "Facebook ID" => user.fb_user_id
      }
    end
  end

  def after_save(user)
    Thread.new do
      $mixpanel.people.set user.id, {
        "$first_name" => user.first_name,
        "$last_name" => user.first_name,
        "Signup" => user.created_at,
        "Username" => user.username,
        "Facebook ID" => user.fb_user_id
      }
    end
  end
end
