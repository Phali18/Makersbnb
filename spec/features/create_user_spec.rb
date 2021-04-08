feature 'user account' do 
  scenario 'user can create a new account' do 
    visit('/')
    fill_in('email', with: 'test@example')
    fill_in('password', with: 'password987')
    click_button('Submit')

    expect(page).to have_content('Makersbnb Properties')
  end 
end 
    
