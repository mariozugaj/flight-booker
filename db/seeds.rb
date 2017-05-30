# Airports

airports = %w(FRA YYZ USH AKL BKK DAR)

airports.each do |airport|
  Airport.create!(code: airport)
end

# Flights

duration = (500...2000).to_a.shuffle.take(30)
price = (300...1100).to_a.shuffle.take(30)
origin_destination_pairs = airports.repeated_permutation(2).to_a.reject { |a| a[0] == a[1] }

origin_destination_pairs.each_with_index do |or_dest_pair, idx|
  Flight.create! origin_id: Airport.find_by_code(or_dest_pair[0]).id,
                 destination_id: Airport.find_by_code(or_dest_pair[1]).id,
                 departure_date: Faker::Time.forward(120),
                 duration: duration[idx],
                 price: price[idx]
end
