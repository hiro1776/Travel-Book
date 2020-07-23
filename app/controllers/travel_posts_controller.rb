class TravelPostsController < ApplicationController
	before_action :authenticate_user!
	def new
		@travel_post = TravelPost.new

	end
	def index
		@serch = TravelPost.ransack(params[:q])
		@travel_posts = TravelPost.all
		@posts = @serch.result.page(params[:page]).per(8)
		@post = current_user.travel_posts.new
	end
	def create
		@travel_post = current_user.travel_posts.new(travel_post_params)

		if @travel_post.save
			redirect_to travel_posts_path(@travel_post.id)
		else
			@travel_post = TravelPost.new
			render 'new'
		end
	end
	def show
		@travel_post = TravelPost.find(params[:id])
		# 投稿に紐づけたタグの取得
		@post_tags = @travel_post.tags
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

	def search
		@tag_list = Tag.all  #全てのタグを表示するために、タグを全取得
		@tag = Tag.find(params[:tag_id])  #タグを取得
		@posts = @tag.posts.all           #タグに紐付けられた投稿を全て表示
	end
	private
	def travel_post_params
		params.require(:travel_post).permit(:user_id, :image_id, :title, :body, :price, :img, :tag_id)
	end

end
