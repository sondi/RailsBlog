class Article < ActiveRecord::Base
	has_many :comments
	belongs_to :user
	validates :title, presence: true,
                    length: { minimum: 5 }

    mount_uploader :image, ImageUploader
end

