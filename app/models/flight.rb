class Flight < ApplicationRecord
  belongs_to :from_airport, foreign_key: :start_airport, class_name: 'Airport'
  belongs_to :to_airport, foreign_key: :finish_airport, class_name: 'Airport'
  has_many :bookings

  validates :start_airport, presence: true

  def self.options_time
    pluck(:start_datetime)
      .uniq
      .map { |dtime| [dtime.strftime('%d-%m-%Y %H:%M'), dtime.strftime('%Y-%m-%d %H:%M:00')] }
  end

  def self.search_flights(flight_params)
    if flight_params.empty?
      nil
    else
      results = Flight.all
      results = results.where([
                                'start_airport = ?', flight_params[:start_airport].to_i
                              ]) if flight_params[:start_airport].present?
      results = results.where([
                                'finish_airport = ?', flight_params[:finish_airport].to_i
                              ]) if flight_params[:finish_airport].present?
      results = results.where([
                                'start_datetime = ?', flight_params[:start_datetime]
                              ]) if flight_params[:start_datetime].present?
      return results
    end
  end
end
