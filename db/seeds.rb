airport_codes = ['SFO', 'NYC', 'LAX', 'ORD', 'DFW', 'ATL']

airport_codes.each do |code|
  Airport.create!(code: code)
end
puts 'Flights seeded successfully!'


airports = Airport.all

airports.each do |departure_airport|
  airports.each do |arrival_airport|
    if !(departure_airport == arrival_airport)
        Flight.create!(
        departure: departure_airport,
        arrival: arrival_airport,
        date: DateTime.now + rand(1..4).days,
        duration: rand(1..4)
        )
    end
  end
end

puts 'Airports seeded successfully!'
