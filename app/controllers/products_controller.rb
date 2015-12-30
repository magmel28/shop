class ProductsController < ApplicationController
  def index
  end

  def show
    @product = Product.find(params[:id])
  end

  def search_suggestions
    query = params[:query]
    result = if params[:query].present?
                Product.where("title ILIKE ? OR description ILIKE ?", "%#{query}%", "%#{query}%").select(:title).collect(&:title)
              else
                []
              end

    render json: result
  end
end
