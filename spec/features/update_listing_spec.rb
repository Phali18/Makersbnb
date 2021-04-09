feature 'update listing ' do
    scenario 'user can update listing information' do
        user = User.create(email: 'JohnSmith@hotmail.com', password: 'password987')
        property = Property.create(name: 'New York Apartment', description: '3 bed apartment in the heart of the city', price: 250, user_id: user.id)

        visit('/properties')
        expect(page).to have_content 'New York Apartment'

        click_button('Edit')

        expect(current_path).to eq ("/properties/#{property.id}/edit")

        fill_in('name', with: 'San Francisco Condo')
        fill_in('description', with: '5 bedroom beachside condo')
        fill_in('price', with: 450)

        click_button('Submit')

        expect(current_path).to eq ("/properties")
        expect(page).not_to have_content('New York Apartment')
        expect(page).to have_content('San Francisco Condo')
    end
end

