if Settings.uses_resque_for_background_emails && defined?(Resque)
  Resque::Server.use(Rack::Auth::Basic) do |user, password|
    # username and password for looking at resque admin
    [user, password] == ["hb-eshop", "hb-eshopP@sSw0Rd"]
  end
end
