class UsersController < ApplicationController
	before_action :authenticate_user!
	def show
		 @user = User.find(params[:id])
	end
	def edit
	end
	def update
		@user = current_user
		if @user.update(user_params)
			flash[:success] = "登録情報を変更しました。"
			redirect to user_path
		else
			render 'edit'
	end
	private
	def user_params
		params.require(:user).permit(:name,:email)
	end
end
