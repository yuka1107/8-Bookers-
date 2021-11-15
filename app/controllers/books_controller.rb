class BooksController < ApplicationController
  def show
    @book = Book

  end

  def index
    @books = Book.all
  end



  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    if book.save
      flash[:notice] = "Book was successfully created."
      redirect_to 'books_index'
    end
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
    paramas.require(:book).permit(:title, :body)
  end
end
