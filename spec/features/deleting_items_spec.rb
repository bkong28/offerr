require 'spec_helper'

feature "Deleting items" do
	scenario "Deleting an item" do
		FactoryGirl.create(:item, title: "Good App", value: "$1", description: "Just OK", location: "New York, New York")

		visit "/"
		click_link "Good App"
		click_link "Delete Item"

		expect(page).to have_content("Item has been destroyed.")

		visit "/"

		expect(page).to have_no_content("Good App")
	end
end