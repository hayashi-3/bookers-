class BooksController < ApplicationController
  def index
  end

  def show
  end

  def new
  	@book = Book.all
  end

  def create
  	book = Book.new(book_params)
  	book.save
  	redirect_to books_path
  end

  def edit
  end

  private
  def book_params
  	params.reqire(:book).permit(:title, :category, :body)
  end
end
