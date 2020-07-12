class About < ApplicationRecord
	belongs_to :user
	belongs_to :travel_post
	belongs_to :contact
end
