class WorkcategoriesController < ApplicationController
	before_action :find_workcategory, only: [:edit, :update, :destroy]
	def index
		@workcategories = Workcategory.all.order("created_at DESC")
	end
	def new
		@workcategory = Workcategory.new
	end
	def create
		@workcategory = Workcategory.new(wcateg_params)
		if @workcategory.save
			flash[:notice] = "Workcategory created"
			redirect_to(:action=>'index', :workcategory_id => @workcategory.id)
		else
			@workcategories = Workcategories.order()
			render('new')
		end
	end

	def edit
	end

	def update
	end

	def destroy
		@workcategory.destroy
		redirect_to workcategories_path
	end
	private
	def find_workcategory
		@workcategory=Workcategory.find(params[:id])
	end
	def wcateg_params
		params.require(:workcategory).permit(:name)
	end
end