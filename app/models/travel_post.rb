class TravelPost < ApplicationRecord
  has_many :tags, through: :travel_post_tag_relations, dependent: :destroy
  has_many :abouts, dependent: :destroy
  has_many :travel_post_tag_relations, dependent: :destroy
  
  belongs_to :user

  validates :user_id, presence: true
  validates :travel_image_url
  validates :title, presence: true
  validates :price
  validates :body, presence: true

  def article_params
    params.require(:travel_post).permit(:title, :body, tag_ids: [])
  end
end
