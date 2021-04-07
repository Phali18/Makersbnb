require 'property'

feature 'viewing the properties' do
    scenario 'going to index page' do
        visit ('/properties')
        expect(page).to have_content('properties')
    end

    scenario 'see a list of all properties' do
        connection = PG.connect(dbname: 'makersbnb_test')
        connection.exec('INSERT INTO properties  VALUES(1,"Big Ben"); ')
        connection.exec('INSERT INTO properties  VALUES(2,"Buckingham Palace"); ')
        connection.exec('INSERT INTO properties  VALUES(3,"Peter Pennywhacker\'s Thrillhouse") ;')
        visit ('/properties')
        expect(page).to have_content("Peter PennyWhacker's Thrillhouse")
        expect(page).to have_content('Big Ben')
        expect(page).to have_content('Buckingham Palace')
    end
end
