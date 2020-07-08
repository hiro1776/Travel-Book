class TravelPost < ApplicationRecord
	has_many :tag_maps, dependent: :destroy
  	has_many :tags, through: :tag_maps

  def save_posts(savepost_tags)
  user_tags = self.tags.pluck(:name) unless self.tags.nil?
  old_tags = current_tags - savepost_tags
  new_tags = savepost_tags - user_tags

    # Destroy old taggings:
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name:old_name)
    end

    # Create new taggings:
    new_tags.each do |new_name|
      post_tag = Tag.find_or_create_by(name:new_name)
      self.tags << post_tag
    end
  end
end
