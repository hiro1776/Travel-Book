class TravelPostsController < ApplicationController
	before_action :authenticate_user!
	def new
		@travel_post = TravelPost.new
	end
	def index
		@travel_post = TravelPost.all
	end
	def create
		@travel_post = TravelPost.new(travel_post_params)
		if travel_post.save
			redirect_to travel_posts_path
		else
			redirect_to :new
		end
	end
	def show
		@travel_post = TravelPost.find(params[:id])
	end
	def edit
	end
	def update
	end
	def destroy
		@travel_post = TravelPost.find(params[:id])
		@travel_post.destroy
		flash[:alert] = "投稿を削除しました"
		redirect_to user_path

	end

end
