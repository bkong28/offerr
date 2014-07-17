require 'spec_helper'

feature "Viewing items" do
	scenario "Listing all items" do
		project = FactoryGirl.create(:item, title: "Good App", value: "$1", description: "Just OK", location: "New York, New York")
		visit '/'
		click_link 'Good App'
		expect(page).to have_title title
	end
end