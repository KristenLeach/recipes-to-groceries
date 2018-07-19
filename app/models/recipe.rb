class Recipe < ApplicationRecord
    belongs_to :user
    has_many :meals
    has_many :users, through: :meals
    has_many :hearts, dependent: :destroy
    has_many :users_who_hearted, through: :hearts, source: :user
    has_many :comments

    mount_uploader :image, ImageUploader
    validates_presence_of :name, :description, :ingredients, :directions, :image
    validate :image_size_validation
 
    def self.best_of
       @recipes = Recipe.joins(:users).group("recipes.id")
    end

    private
    def image_size_validation
        errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
    end

end
