class BookWorksController < ApplicationController
  def index
    @bookWorks = BookWork.all
  end
end
