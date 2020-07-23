class TravelPostTagRelation < ApplicationRecord
  belongs_to :travel_post
  belongs_to :tag

  validates :travel_post_id, presence: true
  validates :tag_id, presence: true
end
