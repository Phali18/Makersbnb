require 'user'
require 'bcrypt'

describe User do
  describe '.create' do
    it 'creates an new user' do
      user = User.create(email: 'JohnSmith@hotmail.com', password: 'password987')

      expect(user).to be_a User
      expect(user.email).to eq 'JohnSmith@hotmail.com'
    end
  end

  describe '.authenticate' do
    it 'returns a user if email and password is correct' do
      user = User.create(email: 'JohnSmith@hotmail.com', password: 'password987')
      authenticated_user = User.authenticate(email: 'JohnSmith@hotmail.com', password: 'password987')

      expect(authenticated_user.id).to eq user.id
    end
    it 'returns nill given an incorrect email address' do
      user = User.create(email: 'JohnSmith@hotmail.com', password: 'password987')

      expect(User.authenticate(email: 'nottherightemail@me.com', password: 'password987')).to be_nil
    end

    it 'returns nill given an incorrect password' do
      user = User.create(email: 'nottherightemail@me.com', password: 'password987')

      expect(User.authenticate(email: 'nottherightemail@me.com', password: 'password123')).to be_nil
    end
  end
end
