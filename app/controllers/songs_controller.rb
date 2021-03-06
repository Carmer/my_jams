class SongsController < ApplicationController

  def index
    session[:hit_counter] ||= 0
    session[:hit_counter] += 1
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      flash[:notice] = "Song saved to your songs"
      redirect_to current_user
    else
      flash[:save_error] = @song.errors.full_messages.join(", ")
      render :new
    end
  end

  def new
    @song = Song.new(user_id: params[:user_id])
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist, :user_id)
  end


end
