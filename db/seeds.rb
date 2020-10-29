# Seed DB for 'airports'
Airport.destroy_all

Airport.create!([
  {airport_name: 'Ho Chi Minh', airport_code: 'HCM'},
  {airport_name: 'Ha Noi', airport_code: 'HN'},
  {airport_name: 'Da Nang', airport_code: 'DN'},
  {airport_name: 'Can Tho', airport_code: 'CT'}
  ])

p "Created #{Airport.count} airports."

# Seed DB for 'flights'
Flight.destroy_all

Flight.create!([
  {start_airport: 1, finish_airport: 2, start_datetime: Time.new(2020, 11, 01, 6, 55), flight_duration: 3},
  {start_airport: 1, finish_airport: 3, start_datetime: Time.new(2020, 11, 01, 6, 55), flight_duration: 2.5},
  {start_airport: 2, finish_airport: 3, start_datetime: Time.new(2020, 11, 01, 6, 55), flight_duration: 1.5},
  {start_airport: 2, finish_airport: 1, start_datetime: Time.new(2020, 11, 13, 20, 45), flight_duration: 1},
  {start_airport: 3, finish_airport: 2, start_datetime: Time.new(2020, 11, 13, 20, 45), flight_duration: 2.5},
  {start_airport: 3, finish_airport: 1, start_datetime: Time.new(2020, 11, 01, 6, 05), flight_duration: 3}
  ])

p "Created #{Flight.count} flights"
