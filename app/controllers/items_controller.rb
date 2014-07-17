class ItemsController < ApplicationController
	def index
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)

		if @item.save
			flash[:notice] = "Item has been created."
			redirect_to @item
		else
		end
	end

	def show
		@item = Item.find(params[:id])
	end

	def update
	end

	def destroy
	end

	private
		def item_params
			params.require(:item).permit(:title, :value, :description, :location)
		end

end
