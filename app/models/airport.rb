class Airport < ApplicationRecord
  has_many :departing_flights, foreign_key: :start_airport, class_name: 'Flight'
  has_many :arriving_flights, foreign_key: :finish_airport, class_name: 'Flight'
end
