class Category < ActiveRecord::Base
  has_many :products, dependent: :destroy

  mount_uploader :image, CategoryImageUploader
end
