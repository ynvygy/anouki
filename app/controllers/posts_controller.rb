class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except:[:index, :show]
	def index
		@posts = Post.all.order("created_at DESC")
	end

	def show
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			flash[:notice] = "Post created"
			redirect_to(:action=>'index', :post_id => @post.id)
		else
			@posts = Posts.order()
			render('new')
		end
	end
	
	def edit
	end

	def update
	end

	def destroy
		@post.destroy
		redirect_to posts_path
	end

	private
	def find_post
		@post=Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :body)
	end
end
