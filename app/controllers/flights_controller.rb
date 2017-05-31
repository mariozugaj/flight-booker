class FlightsController < ApplicationController

  def index
    @airports = Airport.all
    @flight_dates = Flight.pluck(:departure_date).map(&:to_date).uniq.sort
    if params[:flight]
      @flights = Flight.includes(:origin, :destination)
                       .search(params[:flight][:origin],
                               params[:flight][:destination],
                               params[:flight][:departure_date].to_date).decorate
    end
    respond_to do |format|
      format.js {  render layout: false }
      format.html
    end
  end
end
