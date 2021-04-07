require 'property'

describe Property do
    it 'returns array of properties' do 
        expect(Property.all).to include "Peter Pennywhacker's Thrillhouse"
    end
end
