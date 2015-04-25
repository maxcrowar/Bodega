class Work < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  validates :title, :description, :picture, presence: true
end