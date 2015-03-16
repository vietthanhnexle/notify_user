require "kaminari"
require "notify_user/railtie"
require "notify_user/engine"

module NotifyUser

  mattr_accessor :mailer_sender
  @@mailer_sender = nil

  mattr_accessor :authentication_method
  @@authentication_method = nil

  mattr_accessor :current_user_method
  @@current_user_method = nil

  mattr_accessor :unsubscribable_notifications
  @@unsubscribable_notifications = nil

  # Provider for APNS:
  mattr_accessor :apns_provider
  @@apns_provider = nil

  # Number of connections Houston will maintain to APNS:
  mattr_accessor :connection_pool_size
  @@connection_pool_size = nil

  # Time in seconds Houston will wait for a free connection before failing:
  mattr_accessor :connection_pool_timeout
  @@connection_pool_timeout = nil

  # Used to set up NotifyUser from the initializer.
  def self.setup
    yield self
  end

  def self.send_notification(type)
    type.camelize.constantize.new
  end
end

Gem.find_files("notify_user/channels/**/*.rb").each { |path| require path }