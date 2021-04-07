require 'property'

feature 'viewing the properties' do
    scenario 'going to index page' do
        visit ('/properties')
        expect(page).to have_content('properties')
    end

    scenario 'see a list of all properties' do
        connection = PG.connect(dbname: 'makersbnb_test')

        connection.exec("INSERT INTO properties (name) VALUES('Big Ben');")

        visit ('/properties')

        expect(page).to have_content('Big Ben')
    end
end
