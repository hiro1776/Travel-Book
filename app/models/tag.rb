class Tag < ApplicationRecord
	has_many :travel_post_tag_relations, dependent: :destroy
	has_many :travel_posts, through: :travel_post_tag_relations, dependent: :destroy
end
