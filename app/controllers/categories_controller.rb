class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def index
    #@categories = Category.all
    if params[:search].present?
      @categories = Category.where("name = ?", params[:search])
    else
      @categories = Category.all
    end
  end

  def create
    @category = Category.new(params.require(:category).permit(:name))

    if @category.save
      redirect_to categories_path
    else
      render "new"
    end

  end

  def show
    @category = Category.find(params[:id])
    redirect_to category_books_path(@category)
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

end