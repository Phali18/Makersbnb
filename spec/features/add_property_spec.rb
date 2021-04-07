feature 'add property' do
  scenario 'user can add property' do
    visit '/properties/new'
    fill_in('name', with: 'devine lounge')
    fill_in('description', with: '2 bedroom property by the beach')
    fill_in('price', with: '£100')
    click_button('Submit')
    expect(page).to have_content('devine lounge')
    expect(page).to have_content('£100')
    expect(page).to have_content('2 bedroom property by the beach')
  end
end
