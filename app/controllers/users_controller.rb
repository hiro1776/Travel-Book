class UsersController < ApplicationController
	before_action :authenticate_user!
	def show
		 @user = current_user
	end
	def edit
		@user = current_user
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
	private
	def user_params
		params.require(:user).permit(:name,:email)
	end
end
