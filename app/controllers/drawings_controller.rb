class DrawingsController < ApplicationController
	before_action :find_drawing, only: [:edit, :update, :destroy, :show]
	def index
		@drawings = Drawing.all.order("created_at DESC")
	end

	def new
		@drawing = Drawing.new
	end

	def create
		@drawing = Drawing.new(drawing_params)
		if @drawing.save
			flash[:notice] = "Drawing created"
			redirect_to(:action=>'index', :drawing_id => @drawing.id)
		else
			@drawings = Drawings.order()
			render('new')
		end
	end
	
	def edit
	end

	def show
	end

	def update
		if @drawing.update_attributes(drawing_params)
			flash[:notice] = "Drawing updated."
			redirect_to(:action=>"index")
		else
			render("edit")
		end
	end

	def list
  		@drawings = Drawing.where(workcategory_id: params[:workcategory_id]).all
	end


	def destroy
		@drawing.destroy
		redirect_to drawings_path
	end

	def search
		@drawings = Drawing.search(params)
	end

	private
	def find_drawing
		@drawing=Drawing.find(params[:id])
	end

	def drawing_params
		params.require(:drawing).permit( :name, :description, :image)
	end

end