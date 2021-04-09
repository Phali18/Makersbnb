feature 'add property' do
  scenario 'user can add property' do
    user = User.create(email: 'JohnSmith@hotmail.com', password: 'password987')
    
    visit '/sessions/new'
    fill_in('email', with: 'JohnSmith@hotmail.com')
    fill_in('password', with: 'password987')
    click_button 'Sign in'

    visit '/properties'
    click_button 'Add'
    expect(current_path).to eq '/properties/new'

    fill_in('name', with: 'devine lounge')
    fill_in('description', with: '2 bedroom property by the beach')
    fill_in('price', with: 100)
    click_button('Submit')

    expect(current_path).to eq '/properties'
    expect(page).to have_content('devine lounge')
    expect(page).to have_content(100)
    expect(page).to have_content('2 bedroom property by the beach')
  end
end
