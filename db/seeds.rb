# Airports
airport_codes = %w(FRA YYZ USH AKL BKK DAR)

airports = [{ code: 'FRA', city: 'Frankfurt' },
            { code: 'YYZ', city: 'Toronto' },
            { code: 'USH', city: 'Ushuaia' },
            { code: 'AKL', city: 'Auckland' },
            { code: 'BKK', city: 'Bangkok' },
            { code: 'DAR', city: 'Dar es Salaam' }]

airports.each do |airport|
  Airport.create!(code: airport[:code], city: airport[:city])
end

# Flights

origin_destination_pairs = airport_codes.repeated_permutation(2).to_a.reject { |a| a[0] == a[1] }

15.times do
  origin_destination_pairs.each_with_index do |or_dest_pair, _idx|
    Flight.create! origin_id: Airport.find_by_code(or_dest_pair[0]).id,
                   destination_id: Airport.find_by_code(or_dest_pair[1]).id,
                   departure_date: Faker::Time.forward(3),
                   duration: Faker::Number.between(500, 1439),
                   price: Faker::Number.between(300, 1100)
  end
end
