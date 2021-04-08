feature 'authentication' do
    scenario 'a user can sign in' do
       User.create(email: 'test@example.com', password: 'password123')
       visit("/sessions/new")
       fill_in(:email, with: 'test@example.com')
       fill_in(:password, with: 'password123')
       click_button("Sign in")
       expect(page).to have_content('Makersbnb Properties')
    end
    
    scenario 'a user can sign out' do
        User.create(email: 'test@example.com', password: 'password123')
       visit("/sessions/new")
       fill_in(:email, with: 'test@example.com')
       fill_in(:password, with: 'password123')
       click_button("Sign in")
       click_button("Sign out")
       expect(page).not_to have_content('Makersbnb Properties')
       expect(page).to have_content('You have signed out')
    end
end