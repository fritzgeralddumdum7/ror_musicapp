class AlbumsController < ApplicationController
  before_action :set_album, only: [:edit, :destroy, :update]

  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to albums_path, notice: "#{params[:album][:name]} album has been successfully addded."
    else
      render :new, error: "Something went wrong. Please try again!"
    end
  end

  def edit
  end

  def update
    if @album.update(album_params)
      redirect_to albums_path, notice: "#{params[:album][:name]} album has been successfully updated."
    else
      render :edit, error: "Something went wrong. Please try again!"
    end
  end

  def destroy
    @album.destroy

    redirect_to albums_path
  end

  private
  
  def album_params
    is_released = false

    if params[:album][:released] == "Yes"
      is_released = true
    end

    params[:album][:released] = is_released
    params.required(:album).permit(:name, :kind, :length, :cover_art, :released)
  end

  def set_album
    @album = Album.find(params[:id])
  end
end
