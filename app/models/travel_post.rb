class TravelPost < ApplicationRecord
	has_many :travel_post_tag_relations, dependent: :destroy
  	has_many :tags, through: :travel_post_tag_relations, dependent: :destroy
	has_many :abouts, dependent: :destroy

	belongs_to :user

	validates :user_id, presence: true
	validates :title, presence: true
	validates :body, presence: true
	attachment :image
	mount_uploader :img, ImgUploader


	def travel_post_params
		params.require(:travel_post).permit(:title, :img, :body, :tag_id)
	end
end
