class TravelPostsController < ApplicationController
	before_action :authenticate_user!
	def new
		@travel_post = TravelPost.new
	end
	def index
		@tags = Tag.all
		@serch = TravelPost.ransack(params[:q])
		@travel_posts = TravelPost.all
		@posts = @serch.result.page(params[:page]).per(8)
		@post = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : TravelPost.all
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
