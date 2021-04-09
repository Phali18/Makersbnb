feature 'view specific property' do
  scenario 'click on a property' do
    connection = PG.connect(dbname: 'makersbnb_test')

    Property.create(name: 'Big Ben', description: 'London landmark', price: 150)
    Property.create(name: 'Divine Lounge', description: '2 bed flat near beach', price: 100)
    visit('/properties')
    click_on 'Big Ben'

    # take us to Big Ben's show page /properties/1
    expect(page).to have_content('Big Ben')
    expect(page).to have_content('London landmark')
    expect(page).to have_content(150)
    expect(page).not_to have_content('Divine Lounge')
  end
end
