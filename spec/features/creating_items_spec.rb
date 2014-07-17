require 'spec_helper'

feature 'Creating Items' do
	scenario "can create an item" do
		visit '/'

		click_link 'New Item'

		fill_in 'Title', with: "Seafood Platter for 2 at Brandon's"
		fill_in 'Value', with: "$100"
		fill_in 'Description', with: "Yummy Yummy"
		fill_in 'Location', with: "Castle Hill, NSW"
		click_button 'Create Item'

		expect(page).to have_content('Item has been created.')

		item = Item.where(title: "Seafood Platter for 2 at Brandon's").first

		title = "Seafood Platter for 2 at Brandon's - Items - Offerr"
		expect(page).to have_title(title)
	end
end