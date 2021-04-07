require 'property'

describe Property do
    it 'returns array of properties' do 
        connection = PG.connect(dbname: 'makersbnb_test')
        connection.exec("INSERT INTO properties (name) VALUES('Big Ben');")

        expect(Property.all).to include "Big Ben"
    end
end
