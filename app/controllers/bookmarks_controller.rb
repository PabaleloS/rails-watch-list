class BookmarksController < ApplicationController
  # def index
  #   @bookmarks = Bookmark.all
  # end

  # def show
  #   @list = List.find(params[:id])
  # end

  # def new
  #   @bookmark = Bookmark.new
  # end

  def new
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.build
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.build(bookmark_params)
    if @bookmark.save
      redirect_to @list, notice: 'Bookmark was successfully added.'
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.find(params[:id])
    @bookmark.destroy
    redirect_to @list, notice: 'Bookmark was successfully deleted.'
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end

end
