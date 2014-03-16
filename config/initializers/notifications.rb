# ActiveSupport::Notifications.subscribe do |name, start, finish, id, payload|
#   Rails.logger.debug(["notification:", name, payload].join(" "))
# end