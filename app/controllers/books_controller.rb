class BooksController < ApplicationController
  def index
    @book = Book.all
  end
  
  def show 
    @book = Book.find(paramas[:id])
  end
  
  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    if book.save
      flash[:notice] = "Book was successfully created."
      redirect_to '/show'
    end
  end




  private
  def book_params
    paramas.require(:book).permit(:title, :body)
  end
end
