class Item < ActiveRecord::Base
	validates :title, :value, :description, :location, :presence => true
end
