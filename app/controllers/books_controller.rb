class BooksController < ApplicationController

  def index
    @category = Category.find(params[:category_id])
    if params[:search].present?
      @books = @category.books.where("name = ? OR description LIKE ?", params[:search], "%#{params[:search]}%")
    #elsif params[:search_2].present?
    #  @books = @category.books.where("description LIKE ?", "%#{params[:search_2]}%")
    else
      @books = @category.books
    end
  end

  def new
    @category = Category.find(params[:category_id])
    @book = @category.books.build
  end

  def create
    @category = Category.find(params[:category_id])
    @book = @category.books.create(params.require(:book).permit(:name, :description))

    if @book.save
      redirect_to category_books_path
    else
      render 'new'
    end

  end

  def show
    @category = Category.find(params[:category_id])
    @book = @category.books.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:category_id])
    @book = @category.books.find(params[:id])
    @book.destroy
    redirect_to category_books_path
  end

end