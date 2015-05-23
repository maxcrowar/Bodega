class Artist < ActiveRecord::Base
	has_many :works
	validates :name, presence: true, uniqueness: true
  has_secure_password
end
