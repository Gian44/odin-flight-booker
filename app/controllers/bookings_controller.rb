class BookingsController < ApplicationController

  def new
    @flight = Flight.find(params[:flight_id])
    @num_tickets = params[:num_tickets].to_i
    @booking = Booking.new(flight: @flight)
    @num_tickets.times {@booking.passengers.build}
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      @booking.passengers.each do |passenger|
        PassengerMailer.confirmation_email(passenger).deliver_now
      end
      redirect_to booking_path(@booking)
    else
      render :new, notice: 'Booking Invalid'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end
