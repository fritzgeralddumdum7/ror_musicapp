class ArtistsController < ApplicationController
  before_action :set_artist, only: [:edit, :destroy, :update]

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

  def update
    if @artist.update(artist_params)
      redirect_to artists_path, notice: "#{params[:artist][:name]} artist has been successfully updated."
    else
      render :edit, error: "Something went wrong. Please try again!"
    end
  end

  def destroy
    @artist.destroy

    redirect_to artists_path
  end

  private
  
  def artist_params
    params.required(:artist).permit(:name, :permalink, :bio, :avatar)
  end

  def set_artist
    @artist = Artist.find(params[:id])
  end
end
