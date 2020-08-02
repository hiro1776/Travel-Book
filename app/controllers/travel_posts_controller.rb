class TravelPostsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_travel_post, only: [:show, :edit, :update, :destroy]

	# GET /travel_posts
	# GET /travel_posts.json
	def index
		if params[:tag_id]
			@tag = Tag.find(params[:tag_id])
			@travel_posts = @tag.travel_posts.page(params[:page]).per(8)
			@post = TravelPost.new
		else
			@travel_posts = TravelPost.page(params[:page]).per(8)
			@post = TravelPost.new
		end
	end
	# GET /travel_posts/1
	# GET /travel_posts/1.json
	def show
		@post = TravelPost.find(params[:id])
		@user = @travel_post.user
		# 投稿に紐づけたタグの取得
		@travel_post = TravelPost.find(params[:id])
	end

	# GET /travel_posts/new
	def new
		@travel_post = TravelPost.new
	end

	# GET /travel_posts/1/edit
	def edit
		@user = @travel_post.user
		@tag = Tag.find(params[:id])
	end
	def user
		return User.find_by(id:self.user_id)
	end

	# POST /travel_posts
	# POST /travel_posts.json
	def create
		@post = TravelPost.new(travel_post_params)
		@post.user_id = current_user.id
		respond_to do |format|
    		if @post.save(travel_post_params)
        		format.html { redirect_to travel_posts_path(@post.id), notice: 'Travel post was successfully created.' }
        		format.json { render :show, status: :created, location: @post }
    		else
    			@travel_post = TravelPost.new
        		format.html { render :new }
        		format.json { render json: @travel_post.errors, status: :unprocessable_entity }
    		end
    	end
  	end

	# PATCH/PUT /travel_posts/1
	# PATCH/PUT /travel_posts/1.json
	def update
    	respond_to do |format|
    		@travel_post = TravelPost.find(params[:id])
    		if @travel_post.update(travel_post_params)
        		format.html { redirect_to @travel_post, notice: 'Travel post was successfully updated.' }
        		format.json { render :show, status: :ok, location: @travel_post }
      		else
        		format.html { render :edit }
        		format.json { render json: @travel_post.errors, status: :unprocessable_entity }
    		end
    	end
	end

	# DELETE /travel_posts/1
	# DELETE /travel_posts/1.json
	def destroy
		travel_post = TravelPost.find(params[:id])
	    if travel_post.destroy
    		redirect_to travel_posts_path
    	else
    		render :edit
    	end
	end
	def search
		@tag_list = Tag.all  #全てのタグを表示するために、タグを全取得
		@tag = Tag.find(params[:tag_id])  #タグを取得
		@posts = @tag.posts.all           #タグに紐付けられた投稿を全て表示
	end

	def save_tags
    current_tags = self.tagss.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    # Destroy old taggings:
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name:old_name)
    end

    # Create new taggings:
    new_tags.each do |new_name|
      travel_post_tag = Tag.find_or_create_by(name:new_name)
      self.tags << travel_post_tag
    end
  end





	private
    # Use callbacks to share common setup or constraints between actions.
    	def set_travel_post
    		@travel_post = TravelPost.find(params[:id])
    	end

    # Only allow a list of trusted parameters through.
    	def travel_post_params
    		params.require(:travel_post).permit(:user_id, :image, :title, :body, :price, :img, :tag_id, :content )
    	end
end
