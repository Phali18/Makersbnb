require 'property'
require 'user'
require './lib/database_connection'

describe Property do
  describe '.all' do
    it 'returns array of properties' do
      connection = PG.connect(dbname: 'makersbnb_test')
      user = User.create(email: 'JohnSmith@hotmail.com', password: 'password987')
      property_1 = Property.create(name: 'Big Ben', description: 'London landmark', price: 150, user_id: user.id)
      user2 = User.create(email: 'SamSmith@hotmail.com', password: 'password987')
      property_2 = Property.create(name: 'Divine Lounge', description: '2 bed flat near beach', price: 100, user_id: user2.id)

      properties = Property.all
      expect(properties.length).to eq 2
      expect(properties.first).to be_a Property
      expect(properties.first.name).to eq 'Big Ben'
      expect(properties.first.description).to eq 'London landmark'
      expect(properties.first.price).to eq 150
    end
  end

  describe '.create' do
    it 'adds property to list' do
      connection = PG.connect(dbname: 'makersbnb_test')
      user = User.create(email: 'JohnSmith@hotmail.com', password: 'password987')
      property = Property.create(name: 'Bristol', description: '2 bed flat in the heart of the city', price: 100, user_id: user.id)
      user2 = User.create(email: 'SamSmith@hotmail.com', password: 'password987')
      Property.create(name: 'London', description: 'Lovely 2 bed flat in Chelsea', price: 350, user_id: user.id)

      properties = Property.all

      expect(properties.length).to eq 2
      expect(properties.first).to be_a Property
      expect(properties.first.name).to eq 'Bristol'
      expect(properties.first.description).to eq '2 bed flat in the heart of the city'
      expect(properties.first.price).to eq 100
    end
  end

  describe '.find' do
    it 'returns specific information about one property' do
      connection = PG.connect(dbname: 'makersbnb_test')
      user = User.create(email: 'JohnSmith@hotmail.com', password: 'password987')
      property_1 = Property.create(name: 'Big Ben', description: 'London landmark', price: 150, user_id: user.id)
      user2 = User.create(email: 'SamSmith@hotmail.com', password: 'password987')
      property_2 = Property.create(name: 'Divine Lounge', description: '2 bed flat near beach', price: 100, user_id: user2.id)

      # need the id there 
      property = Property.find(id: property_1.id)

      expect(property).to be_a Property

      expect(property.id).to eq property_1.id

      expect(property.name).to eq 'Big Ben'
      expect(property.description).to eq 'London landmark'
      expect(property.price).to eq 150
      
    end
  end
end
