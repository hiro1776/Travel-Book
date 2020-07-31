class Tag < ApplicationRecord
	has_many :travel_posts, dependent: :destroy
	
	validates :name, uniqueness: true
end
