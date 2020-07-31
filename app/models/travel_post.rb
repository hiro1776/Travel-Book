class TravelPost < ApplicationRecord
	belongs_to :user
	belongs_to :tag

	validates :user_id, presence: true
	validates :title, presence: true
	validates :body, presence: true
	attachment :image
	mount_uploader :img, ImgUploader

end
