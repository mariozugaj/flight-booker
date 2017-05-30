class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @flight_dates = Flight.pluck(:departure_date).map(&:to_date).uniq.sort
    if params[:flight].present?
      @flights = Flight.search(params[:flight][:origin],
                               params[:flight][:destination],
                               params[:flight][:departure_date].to_date).decorate
    end
    p @flights
  end
end
