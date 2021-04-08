require 'user'
require 'bcrypt'

describe User do 
  describe '.create' do
    it 'creates an new user' do 
      user = User.create(name: 'John Smith', email: 'JohnSmith@hotmail.com', password: 'password987')

      expect(user).to be_a User
      expect(user.name).to eq 'John Smith'
      expect(user.email).to eq 'JohnSmith@hotmail.com'

    end 
  end 
end 