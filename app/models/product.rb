class Product < ActiveRecord::Base
  belongs_to :category
  has_many :line_items, dependent: :destroy

  mount_uploader :image, ProductImageUploader

  def to_param
    "#{id}-#{title.parameterize}"
  end

  def self.sorted(sort_params)
    unless sort_params.nil?
      if sort_params == 'by_price_up'
        order(:price)
      elsif sort_params == 'by_price_down'
        order(:price).reverse
      end
    else
      order(:id)
    end
  end
end
