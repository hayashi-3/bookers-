class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all.order(created_at: :asc)
  end

  def show
    @book = Book.all(params[:id])
  end

  def new
  end

  def create
  	book = Book.new(book_params)
  	book.save
  	redirect_to book_path(book.id)
  end

  def edit
    @book = book.find(params[:id])
  end

  def destroy
    book = book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
