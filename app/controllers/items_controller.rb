class ItemsController < ApplicationController
	def index
		@items = Item.all
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
			flash[:alert] = "Project has not been created."

			render "new"
		end
	end

	def show
		@item = Item.find(params[:id])
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:id])
		if @item.update(item_params)
			flash[:notice] = "Item has been updated."
			redirect_to @item
		else
			flash[:alert] = "Item has not been updated."
			render "edit"
		end
	end

	def destroy
		@item = Item.find(params[:id])
		@item.destroy

		flash[:notice] = "Item has been destroyed."

		redirect_to items_path

	end

	private
		def item_params
			params.require(:item).permit(:title, :value, :description, :location)
		end

end
