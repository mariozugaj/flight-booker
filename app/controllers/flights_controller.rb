class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @flight_dates = Flight.pluck(:departure_date).map(&:to_date).uniq.sort
  end
end
