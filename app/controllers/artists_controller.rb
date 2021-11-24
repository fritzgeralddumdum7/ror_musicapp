class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :destroy, :update]

  def index
    @artists = Artist.all
  end
  
  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      redirect_to artists_path, notice: "#{params[:artist][:name]} artist has been successfully addded."
    else
      render :new, error: "Something went wrong. Please try again!"
    end
  end

  def edit
  end

  def show
    @albums = Album.all
  end

  def update
    if @artist.update(artist_params)
      redirect_to artists_path, notice: "#{params[:artist][:name]} artist has been successfully updated."
    else
      render :edit, error: "Something went wrong. Please try again!"
    end
  end

  def destroy
    @artist.destroy

    redirect_to artists_path, notice: "An artist has been deleted successfully."
  end

  private
  
  def artist_params
    params[:artist][:slug] = params[:artist][:name].gsub(/_/, '-').parameterize(preserve_case: true)
    params.required(:artist).permit(:name, :bio, :avatar, :cover_art, :slug, :formed_at)
  end

  def set_artist
    @artist = params[:id].match(/^[A-Za-z0-9]+(?:-[A-Za-z0-9]+)*$/) ?  Artist.friendly.find(params[:id]) : Artist.find(params[:id])
  end
end
