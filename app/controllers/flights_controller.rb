class FlightsController < ApplicationController
    def index
      flights = Flight.all
      flights = flights.where(departure_id: params[:departure_id]) if params[:departure_id].present?
      flights = flights.where(arrival_id: params[:arrival_id]) if params[:arrival_id].present?
      flights = flights.where(date: Date.parse(params[:flight_date])) if params[:flight_date].present?
  
      @flights = flights
    end
  end