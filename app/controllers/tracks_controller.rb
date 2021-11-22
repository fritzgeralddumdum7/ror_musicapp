class TracksController < ApplicationController
  before_action :set_track, only: [:edit, :destroy, :update]
  
  def index
    @tracks = Track.all
  end

  def new
    @track = Track.new
  end
  
  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to tracks_path, notice: "#{params[:track][:name]} track has been successfully addded."
    else
      render :new, error: 'Something went wrong. Please try again!'
    end
  end

  def edit
  end

  def update
    if @track.update(track_params)
      redirect_to tracks_path, notice: "#{params[:track][:name]} track has been successfully updated."
    else
      render :edit, error: 'Something went wrong. Please try again!'
    end
  end

  def destroy
    @track.destroy

    redirect_to tracks_path
  end

  private
  
  def track_params
    params.required(:track).permit(:name, :url, :credits)
  end

  def set_track
    @track = Track.find(params[:id])
  end
end
