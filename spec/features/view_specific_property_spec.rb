feature 'view specific property' do
  scenario 'click on a property' do
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec("INSERT INTO properties (name) VALUES('Big Ben');")
    connection.exec("INSERT INTO properties (name) VALUES('Buckingham Palace');")
    visit ("/properties")
    click_on 'Big Ben'

    # take us to Big Ben's show page /properties/1 
    expect(page).to have_content("Big Ben")
    expect(page).not_to have_content("Buckingham Palace")
  end
end