class User < ApplicationRecord
    has_secure_password
    has_many :recipes
    mount_uploader :image, ImageUploader
end
