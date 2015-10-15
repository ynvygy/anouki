class DrawingsController < ApplicationController
	before_action :find_drawing, only: [:edit, :update, :destroy]
	before_filter :list
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

	def update
		if @drawing.update_attributes(drawing_params)
			flash[:notice] = "Drawing updated."
			redirect_to(:action=>"index")
		else
			render("edit")
		end
	end

	def destroy
		@drawing.destroy
		redirect_to drawings_path
	end
	def list
  		@drawingsz = Drawing.order("drawings.id ASC").where(:workcategory_id => @workcategory.try(:name))
	end

	private
	def find_drawing
		@drawing=Drawing.find(params[:id])
	end

	def drawing_params
		params.require(:drawing).permit(:name, :description, :image)
	end

end