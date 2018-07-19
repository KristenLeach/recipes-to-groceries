class User < ApplicationRecord
    has_many :recipes
    has_many :meals
    has_many :meal_list, through: :meals, source: :recipe
    mount_uploader :image, ImageUploader
    has_many :hearts, dependent: :destroy
    has_many :hearted_recipes, through: :hearts, source: :recipe 
    has_many :comments 
    
    has_secure_password
    validates_presence_of :name, :email
    validates :password, length: { minimum: 8 }, allow_nil: true
    validates :email, :uniqueness => {:case_sensitive => false}
    validate :image_size_validation

    # creates a new heart row with recipe_id and user_id
    def heart!(recipe)
        self.hearts.create!(recipe_id: recipe.id)
    end
      
      # destroys a heart with matching recipe_id and user_id
    def unheart!(recipe)
        heart = self.hearts.find_by_recipe_id(recipe.id)
        heart.destroy!
    end
      
      # returns true or false if a recipe is hearted by user
    def heart?(recipe)
        self.hearts.find_by_recipe_id(recipe.id)
    end


    private
    def image_size_validation
        errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
    end

end
