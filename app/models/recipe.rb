class Recipe < ApplicationRecord
    belongs_to :user
    has_many :meals
    has_many :users, through: :meals

    mount_uploader :image, ImageUploader
    validates_presence_of :name, :description, :ingredients, :directions, :image
    validate :image_size_validation
 
    def self.best_of
        Recipe.where(:liked => true)
    end

    def self.popular_recipes
        Recipe.find_each do |recipe|
            recipe.users.count > 1
        end
    end

    private
    def image_size_validation
        errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
    end

end
