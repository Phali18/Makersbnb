feature 'update listing ' do
    scenario 'user can update listing information' do
        property = Property.create(name: 'New York Apartment', description: '3 bed apartment in the heart of the city', price: 250)

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

