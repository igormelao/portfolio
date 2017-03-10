class BookWorksController < ApplicationController
  def index
    @bookWorks = BookWork.all
  end

  def new
    @bookwork = BookWork.new
  end

  def create
    @bookwork = BookWork.new(bookwork_params)
    if @bookwork.save
      redirect_to book_works_path, notice: "Your bookwork was created with sucessfully"
    else
      render :new
    end
  end

  def show
    @bookwork = BookWork.find(params[:id])
  end

  private

  def bookwork_params
    params.require(:book_work).permit(:title, :subtitle, :body)
  end
end
