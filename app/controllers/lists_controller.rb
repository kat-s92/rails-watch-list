class ListsController < ApplicationController
  # before_action :set_list, only: [:show, :destroy]
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    # @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    # redirect_to lists_path
    if @list.save
      redirect_to lists_path
    else
      render 'lists/new', status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path, status: :see_other
  end


  def list_params
    params.require(:list).permit(:name)
  end
end
