class ArtistController < ApplicationController
  def index
  end

  def show
    @artist = Artist.find(params[:id].to_i)
  end

  def new
  end

  def edit
  end

  def create
    @artist = Artist.new
    @artist.name = params[:artist][:name]
    if @artist.save
      redirect_to artist_path(@artist.id)
    else
      render new_artist_path
    end
  end

  def update
  end

  def destroy
    begin
      @artist = Artist.find(params[:id])
      if @artist.destroy
        redirect_to artist_index_path
      end
    rescue ActiveRecord::RecordNotFound
    end
  end
end
