require 'property'

describe Property do
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
