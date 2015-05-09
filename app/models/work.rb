class Work < ActiveRecord::Base
  belongs_to :artist
  mount_uploader :picture, PictureUploader
  validates :title, :description, :picture, presence: true
end