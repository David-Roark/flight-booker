class FlightsController < ApplicationController
  require 'pry'
  def index
    if params[:commit] == 'Search'
      @airports = Airport.pluck :airport_name, :id
      @start_datetime = Flight.options_time
      @results = Flight.search_flights(flight_params)
      @num_tickets = flight_params[:num_tickets] if params[:flight]

      render 'index'
    elsif params[:commit] == 'Book'
      @num_tickets = book_params[:num_tickets]
      @flight = Flight.find(book_params[:id_flight])
      @booking = @flight.bookings.build
      (@num_tickets.to_i).times { @booking.passengers.build }
      render 'bookings/new'
    else
      @airports = Airport.pluck :airport_name, :id
      @start_datetime = Flight.options_time
    end
  end

  private
  def flight_params
    params.require(:flight).permit(:start_airport, :finish_airport, :start_datetime, :num_tickets) rescue []
  end

  def book_params
    params.require(:book).permit(:num_tickets, :id_flight)
  end
end
