class ProductsController < ApplicationController
  def index
    @categories = Category.all

    if params[:category].present?
      @products = Product.where(category_id: params[:category]).sorted(params[:sort])
      @category = @products.first.category
    elsif params[:query].present?
      @query = params[:query]
      @products = Product.where("title LIKE ? OR description LIKE ?", "%#{@query}%", "%#{@query}%").sorted(params[:sort])
    else
      @products = Product.all.sorted(params[:sort])
    end
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
    #redirect_to products_path(query: 'Lacosta')
  end


end
