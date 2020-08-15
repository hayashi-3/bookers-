class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all.order(created_at: :asc)

  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
  	book = Book.new(book_params)
  	book.save
    flash[:notice] = "Book was successfully created."
  	redirect_to book_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
