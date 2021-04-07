feature 'test' do
 scenario 'it returns a test page' do
  visit('/test')

  expect(page).to have_content('This is a test page!')
 end
end
