require 'spec_helper'

feature "Editing Items" do
	before do
		FactoryGirl.create(:item, title: "Good App", value: "$1", description: "Just OK", location: "New York, New York")

		visit "/"
		click_link "Good App"
		click_link "Edit Item"
	end

	scenario "Updating an item" do
		fill_in "Title", with: "Better App"
		click_button "Update Item"

		expect(page).to have_content("Item has been updated.")
	end
end
