class Work < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
end