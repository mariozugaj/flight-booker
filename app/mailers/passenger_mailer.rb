class PassengerMailer < ApplicationMailer
  def booking_confirmation(passenger, booking)
    @booking = booking
    @passenger = passenger
    mail(to: @passenger.email, subject: 'Booking confirmation')
  end
end
