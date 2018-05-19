class User < ApplicationRecord
    has_secure_password
    has_many :recipes
    has_many :meals
    has_many :recipes, through: :meals 
    mount_uploader :image, ImageUploader
    validate :image_size_validation
 
    private
    def image_size_validation
        errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
    end

end
