module CurrentUserConcern
  extend ActiveSupport::Concern

  def current_user
    super || gest_user
  end

  def gest_user
    guest = GuestUser.new
    guest.name = "Guest User"
    guest.first_name = "Guest"
    guest.email = "guest@example.com"
    guest
  end
end
