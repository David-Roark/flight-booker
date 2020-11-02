class PassengerMailer < ApplicationMailer
  default from: 'dr@example.com'
  def thank_you
    @flight = params[:flight]
    @booking = params[:booking]
    @passengers = params[:passengers]
    @url = 'https://google.com'
    mail( to: @passengers.email, subject: "Thank you for booking! #{@passengers.name}")
  end
end
