class FlightDecorator < Draper::Decorator
  delegate_all

  def view_date
    object.departure_date.to_date
  end

  def view_time
    object.departure_date.strftime "%H:%M"
  end

  def view_duration
    Time.at(object.duration*60).utc.strftime "%H:%M"
  end
end
