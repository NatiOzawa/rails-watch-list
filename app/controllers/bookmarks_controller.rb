class BookmarksController < ApplicationController

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @bookmark
      if bookmark.save
        redirect_to list_path(list)
      else
        render "lists/show", status: unprocessable_entity
      end
    end

  def create
    list = List.find(params[:list_id])
    movie = Movie.find(params[:bookmark][:movie])
    bookmark = Bookmark.new(bookmark_params)
    bookmark.list = list
    bookmark.movie = movie
    bookmark.save
    redirect_to list_path(list)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to lists_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
