class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_many :travel_posts, dependent: :destroy

   def already_liked?(travel_post)
    self.likes.exists?(travel_post_id: travel_post.id)
  end

end
