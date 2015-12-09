class Product < ActiveRecord::Base
  belongs_to :category

  mount_uploader :image, ProductImageUploader

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
