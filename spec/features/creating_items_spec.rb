require 'spec_helper'

feature 'Creating Items' do
	before do
		visit '/'
		click_link 'New Item'
	end	

	scenario "can create an item" do
		fill_in 'Title', with: "Brandon's App"
		fill_in 'Value', with: "$100"
		fill_in 'Description', with: "Best App EVER!"
		fill_in 'Location', with: "Online"
		click_button 'Create Item'

		expect(page).to have_content('Item has been created.')

		item = Item.where(title: "Brandon's App").first

		title = "Brandon's App - Items - Offerr"
		expect(page).to have_title(title)
	end

	scenario "can not create an item without a title" do
		fill_in 'Value', with: "$100"
		fill_in 'Description', with: "Best App EVER!"
		fill_in 'Location', with: "Online"
		click_button 'Create Item'

		expect(page).to have_content("Title can't be blank")
	end

	scenario "can not create an item without a value" do
		fill_in 'Title', with: "Brandon's App"
		fill_in 'Description', with: "Best App EVER!"
		fill_in 'Location', with: "Online"
		click_button 'Create Item'

		expect(page).to have_content("Value can't be blank")
	end

	scenario "can not create an item without a description" do
		fill_in 'Title', with: "Brandon's App"
		fill_in 'Value', with: "$100"
		fill_in 'Location', with: "Online"
		click_button 'Create Item'

		expect(page).to have_content("Description can't be blank")
	end

	scenario "can not create an item without a location" do
		fill_in 'Title', with: "Brandon's App"
		fill_in 'Value', with: "$100"
		fill_in 'Description', with: "Best App EVER!"
		click_button 'Create Item'

		expect(page).to have_content("Location can't be blank")
	end
end