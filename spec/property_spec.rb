require 'property'
require './lib/database_connection'

describe Property do 
  describe '.create' do 
    it 'adds property to list' do 
      connection = PG.connect(dbname: 'makersbnb_test')

      property = Property.create(name: 'Bristol', description: '2 bed flat in the heart of the city', price: 100)
      Property.create(name: 'London', description: 'Lovely 2 bed flat in Chelsea', price: 350)

      properties = Property.all

      expect(properties.length).to eq 1
      expect(properties.first).to be_a Property
      expect(properties.first.name).to eq 'Bristol'
      expect(properties.first.description).to eq '2 bed flat in the heart of the city'
      expect(properties.first.price).to eq 100
    end 
  end
end 

