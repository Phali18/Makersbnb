feature 'request a booking' do
  scenario 'submit a booking' do
    connection = PG.connect(dbname: 'makersbnb_test')
    user = User.create(email: 'JohnSmith@hotmail.com', password: 'password987')
    property_1 = Property.create(name: 'Big Ben', description: 'London landmark', price: 150, user_id: user.id)
    property_2 = Property.create(name: 'Divine Lounge', description: '2 bed flat near beach', price: 100, user_id: user.id)

    visit('/')
    fill_in('email', with: 'test@example')
    fill_in('password', with: 'password987')
    click_button('Submit')
    
    click_on "Big Ben"
    
    expect(current_path).to eq ("/properties/#{property_1.id}")
    fill_in('booking_details', with: 'I would like to stay on the 5th May 2020')

    click_on 'Submit Booking Request' 
    expect(current_path).to eq "/requests"
    expect(page).to have_content 'I would like to stay on the 5th May 2020'
  
  end
end

