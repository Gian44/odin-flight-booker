class Flight < ApplicationRecord
  belongs_to :departure, :class_name => 'Airport'
  belongs_to :arrival, :class_name => 'Airport'
  has_many :bookings

  def self.search_flights(departure_airport_id, arrival_airport_id, flight_date)
    flights = Flight.all

    flights = flights.where(departure_id: departure_airport_id) if departure_airport_id.present?
    flights = flights.where(arrival_id: arrival_airport_id) if arrival_airport_id.present?
    flights = flights.where(date: flight_date.to_date.beginning_of_day..flight_date.to_date.end_of_day) if flight_date.present?

    flights
  end
end
