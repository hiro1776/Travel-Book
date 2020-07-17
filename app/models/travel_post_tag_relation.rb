class TravelPostTagRelation < ApplicationRecord
  belongs_to :travel_post
  belongs_to :tag
end
