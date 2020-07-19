class TravelPost < ApplicationRecord
  has_many :travel_post_tag_relations, dependent: :destroy
  has_many :tags, through: :travel_post_tag_relations
  has_many :abouts, dependent: :destroy
  
  belongs_to :user

  validates :user_id, presence: true
  validates :title, presence: true
  validates :body, presence: true

  def travel_post_params
    params.require(:travel_post).permit(:title, :body, tag_ids: [])
  end
end
