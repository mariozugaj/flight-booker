class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params: id)
  end
end
