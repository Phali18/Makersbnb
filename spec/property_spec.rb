require 'property'
require './lib/database_connection'

describe Property do
  
  describe '.all' do 
   it 'returns array of properties' do 
      connection = PG.connect(dbname: 'makersbnb_test')
      property_1 = Property.create(name: 'Big Ben', description: 'London landmark', price: 150)
      property_2 = Property.create(name: 'Divine Lounge', description: '2 bed flat near beach', price: 100)

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

      property = Property.create(name: 'Bristol', description: '2 bed flat in the heart of the city', price: 100)
      Property.create(name: 'London', description: 'Lovely 2 bed flat in Chelsea', price: 350)

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

      property_1 = Property.create(name: 'Big Ben', description: 'London landmark', price: 150)
      property_2 = Property.create(name: 'Divine Lounge', description: '2 bed flat near beach', price: 100)

      # need the id there 
      property = Property.find(property_1.id)

      expect(property.length).to eq 1
      expect(property.first).to be_a Property
      expect(property.first.name).to eq 'Big Ben'
      expect(property.first.description).to eq 'London landmark'
      expect(property.first.price).to eq 150
      
    end
  end
end 


