class PagesController < ApplicationController
  def home
    @products = Product.all
    @categories = Category.all
  end

  def about
  end

  def contact
  end
end
