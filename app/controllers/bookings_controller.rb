class BookingsController < ApplicationController

  def index
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = Flight.find_by_id(@booking.flight_id).decorate
    @passengers = @booking.passengers.decorate
  end

  def new
    @flight = Flight.find_by_id(params[:flight_id]).decorate
    @booking = @flight.bookings.build
    @seats = params[:seats].to_i
    @seats.times { @booking.passengers.build }
  end

  def create
    @flight = Flight.find_by_id(params[:booking][:flight_id]).decorate
    @booking = @flight.bookings.build(booking_params)
    if @booking.save
      @booking.passengers.each do |passenger|
        PassengerMailer.booking_confirmation(passenger, @booking).deliver_now!
      end
      flash[:success] = 'You successfuly bought tickets!'
      redirect_to @booking
    else
      Rails.logger.info(@booking.errors.inspect)
      flash[:danger] = 'Booking was unsuccessful'
      render 'new'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id,
                                    passengers_attributes: [:first_name,
                                                            :last_name,
                                                            :email,
                                                            :booking_id])
  end
end
