class Article < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length:{in:1..500}
  mount_uploader :image, ImageUploader
end
