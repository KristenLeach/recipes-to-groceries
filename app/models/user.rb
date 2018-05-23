class User < ApplicationRecord
    has_many :recipes
    has_many :meals
    has_many :meal_list, through: :meals, source: :recipe
    mount_uploader :image, ImageUploader
    
    has_secure_password
    validates_presence_of :name, :email
    validates :password, length: { minimum: 8 }, allow_nil: true
    validates :email, :uniqueness => {:case_sensitive => false}
    validate :image_size_validation
 
    private
    def image_size_validation
        errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
    end

end
