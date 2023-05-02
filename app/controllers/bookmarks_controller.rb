class BookmarksController < ApplicationController
  before_action :set_list, only: %i[create new]
  # before_action :set_bookmark, only: %i[destroy]
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.movie = Movie.find(params[:bookmark][:movie_id])
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # @bookmark = Bookmark.find(params[:id])
    @bookmark = Bookmark.find(params[:list_id])
    # raise
    @bookmark.destroy
    # redirect_to list_path(@bookmark.list), status: :see_other
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  # def set_bookmark
  #   @bookmark = Bookmark.find(params[:id])
  # end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
