# Airports

airports = %w(FRA YYZ USH AKL BKK DAR)

airports.each do |airport|
  Airport.create!(code: airport)
end

# Flights

origin_destination_pairs = airports.repeated_permutation(2).to_a.reject { |a| a[0] == a[1] }

8.times do
  origin_destination_pairs.each_with_index do |or_dest_pair, idx|
    Flight.create! origin_id: Airport.find_by_code(or_dest_pair[0]).id,
                   destination_id: Airport.find_by_code(or_dest_pair[1]).id,
                   departure_date: Faker::Time.forward(3),
                   duration: Faker::Number.between(500, 2000),
                   price: Faker::Number.between(300, 1100)
  end
end
