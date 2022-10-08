class Article < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length:{in:1..500}
  validates :image, presence: true
  mount_uploader :image, ImageUploader
end
