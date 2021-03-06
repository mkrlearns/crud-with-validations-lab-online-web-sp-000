class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def edit
    @song = Song.find(params[:id])
  end

  def create
    @song = Song.new(song_params)
    @song.save ? (redirect_to @song) : (render :new)
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_url
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params) ? (redirect_to @song) : (render :edit)
  end

  private

  def song_params
    params.require(:song).permit(
      :title, :released, :release_year, :artist_name, :genre
    )
  end

end
