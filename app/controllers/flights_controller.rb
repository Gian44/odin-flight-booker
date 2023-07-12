class FlightsController < ApplicationController

    def index
        @flights = Flight.search_flights(params[:departure_id], params[:arrival_id], params[:flight_date])
    end
end
