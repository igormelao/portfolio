class BookWorksController < ApplicationController
  before_action :set_bookwork, only: [:show, :edit, :update, :destroy]
  layout 'bookwork'
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all
  def index
    @book_works = BookWork.all
  end

  def new
    @bookwork = BookWork.new
    3.times { @bookwork.technologies.build }
  end

  def create
    @bookwork = BookWork.new(bookwork_params)
    if @bookwork.save
      redirect_to book_works_path, notice: "Your bookwork item was created with sucessfully"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @bookwork.update(bookwork_params)
      redirect_to book_works_path, notice: "Your bookwork item was updated with sucessfully"
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @bookwork.destroy
    redirect_to book_works_path, notice: "Your bookwork item was destroyed sucessfully"
  end

  private

    def set_bookwork
      @bookwork = BookWork.find(params[:id])
    end

    def bookwork_params
      params.require(:book_work).permit(:title,
                                        :subtitle,
                                        :body,
                                        technologies_attributes: [:name]
                                        )
    end
end
