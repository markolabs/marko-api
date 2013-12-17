if ENV["ZEROPUSH_TOKEN"] == "PROD"
  ZeroPush.auth_token = ENV["ZEROPUSH_PROD_TOKEN"]
elsif ENV["ZEROPUSH_TOKEN"] == "DEV"
  ZeroPush.auth_token = ENV["ZEROPUSH_DEV_TOKEN"]
end

