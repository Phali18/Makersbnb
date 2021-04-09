require_relative 'database_connection'
require 'pg'

class BookingRequest
  attr_reader :id, :user_id, :property_id, :booking_details

  def initialize(id:, user_id:, property_id:, booking_details: )
    @id = id
    @user_id = user_id
    @property_id = property_id
    @booking_details = booking_details
  end

  def self.create(user_id:, property_id:, booking_details: )
    result = 
      DatabaseConnection.query("INSERT INTO booking_requests 
        (user_id, property_id, booking_details)
        VALUES('#{user_id}', '#{property_id}', '#{booking_details}')
        RETURNING id, user_id, property_id, booking_details;")
    BookingRequest.new(id: result[0]['id'], user_id: result[0]['user_id'], property_id: result[0]['property_id'], booking_details: result[0]['booking_details'])
  end
end