class ListsController < ApplicationController
  before_action :set_lists, only: %i[ show ]

  def index
    @lists = List.all
    @bookmark = Bookmark.all
  end

  def show

  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params_lists)
    if @list.save
      redirect_to list_path(@list), notice: "Restaurant was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_lists
    @list = List.find(params[:id])
  end

  def params_lists
    params.require(:list).permit(:name)
  end

end
