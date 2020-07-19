class PostHistorysController < ApplicationController
  before_action :authenticate_user!
  def index
    @post_histories = current_user.post_histories
  end

  def show
    @post_history = PostHistory.find(params[:id])
  end

  def edit
    @post_history = PostHistory.find(params[:id])
  end

  def destroy
    post_history = PostHistory.find(params[:id])
    post_history.destroy
    redirect_to  post_histories_path
  end

  def update
    post_history = PostHistory.find(params[:id])
    post_history.update(post_history_params)
    redirect_to post_histories_path
  end
end
