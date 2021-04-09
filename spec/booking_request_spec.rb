require 'booking_request'

describe BookingRequest do
  # describe '.all' do
  #   it 'returns an array of all booking_requests' do
      
  #   end
  # end

  describe '.create' do
    it 'returns all the details of a booking' do
      connection = PG.connect(dbname: 'makersbnb_test')
      user = User.create(email: 'JohnSmith@hotmail.com', password: 'password987')
      property = Property.create(name: 'Bristol', description: '2 bed flat in the heart of the city', price: 100, user_id: user.id)
      

      request_1 = BookingRequest.create(user_id: user.id, property_id: property.id, booking_details: "Stay forever")

      expect(request_1.user_id).to eq user.id
      expect(request_1.property_id).to eq property.id
      expect(request_1.booking_details).to eq "Stay forever"

    end
  end
end