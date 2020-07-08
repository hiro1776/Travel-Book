class Tag < ApplicationRecord
	has_many :tag_maps, dependent: :destroy, foreign_keys: 'tag_id'
	has_many :travel_posts through: :tag_maps
end
