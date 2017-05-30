# Airports

airports = %w(ZAG DUB FRA SVO DXB YYZ LHR MEX USH AKL BKK DAR)

airports.each do |airport|
  Airport.create!(airport_code: airport)
end
