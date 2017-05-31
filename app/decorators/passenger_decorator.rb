class PassengerDecorator < ApplicationDecorator
  delegate_all

  def full_name
    "#{object.first_name} #{object.last_name}"
  end
end
