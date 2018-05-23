class Session < ActiveRecord::Base
    mount_uploader :image, ImageUploader
    validate :image_size_validation
 
    private
    def image_size_validation
        errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
    end

  end
  