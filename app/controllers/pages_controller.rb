class PagesController < ApplicationController
  def home
    @products = Product.all
    @categories = Category.all

    if params[:category].present?
      @products = Product.where(category_id: params[:category])
    end
  end

  def about
  end

  def contact
  end
end
