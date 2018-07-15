class Heart < ApplicationRecord
    belongs_to :recipe
    belongs_to :user 

    validates :user_id, uniqueness: { scope: :recipe_id }
end
