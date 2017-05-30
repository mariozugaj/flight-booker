class Integer
  def pretty_duration
    parse_string =
      if self < 60
        '%M'
      else
        '%H:%M'
        end

    Time.at(self).utc.strftime(parse_string)
  end
end
