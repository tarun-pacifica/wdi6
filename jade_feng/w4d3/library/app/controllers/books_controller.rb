class BooksController < ApplicationController
	def index
		@books = Book.all 	 # Calls out all the artists into a variable to show !
	end

	def new
		@book = Book.new
	end

	def create
		book = Book.create book_params
		redirect_to book
	end

	def show
		@book = Book.find params[:id]
	end

	def edit
		@book = Book.find params[:id]
	end

	def update
		book = Book.find params[:id]
		book.update book_params
		redirect_to book
	end

	def destroy
		book = Book.find params[:id]
		book.destroy
		redirect_to books_path
	end

	private 	# Strong params to protect your params
	def book_params
		params.require(:book).permit(:title, :series, :language, :genre, :published, :image, :author_id, :duedate, :user_id)
	end 

end
