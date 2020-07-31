class UsersController < ApplicationController
	before_action :authenticate_user!
	def show
		 @user = User.find(params[:id])
		 @users = User.all
	end
	def edit
		@user = current_user
	end

	def mypost
		@travel_posts = current_user.travel_posts.all
		@serch = TravelPost.ransack(params[:q])
		@posts = @serch.result.page(params[:page]).per(8)
	end

	def update
		@user = current_user
		if @user.update(user_params)
			flash[:success] = "登録情報を変更しました。"
			redirect_to user_path(current_user)
		else
			render edit_user_path(current_user)
		end
	end
	def likes
		@user = User.find_by(id: params[:id])
		@likes = Like.where(user_id: @user.id)
		@post = TravelPost.find_by(id: @likes.travel_post_id)
	end
	private
	def user_params
		params.require(:user).permit(:name,:email)
	end
end
