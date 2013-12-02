if Rails.env.production?
  ZeroPush.auth_token = ENV["ZEROPUSH_PROD_TOKEN"]
else
  ZeroPush.auth_token = ENV["ZEROPUSH_DEV_TOKEN"]
end