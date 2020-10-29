class BookingsController < ApplicationController

  def create
    @flight = Flight.find(booking_params[:flight_id])
    @booking = @flight.bookings.build booking_params
    if @booking.save
      redirect_to @booking
    else
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
  end

  private
  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end
