class AlbumsController < ApplicationController
    before_action :require_logged_in

    def new
        @band = Band.find_by(id: params[:band_id])
        @album = Album.new(band_id: params[:band_id])
        render :new 
    end

    def create
        @album = Album.new(album_params)
        if @album.save
            redirect_to album_url(@album)
        else
            @band = @album.band 
            # if not successful, we set the band of that album to @band
            flash.now[:errors] = @album.errors.full_messages
            render :new
        end
    end
    
    def edit
        @album = Album.find_by(id: params[:id])
        render :edit 
    end

    def show
        @album = Album.find_by(id: params[:id])
        render :show 
    end

    def update
        @album = Album.find_by(id: params[:id])
        if @album.update(album_params)
            redirect_to album_url(@album)
        else
            flash.now[:errors] = @album.errors.full_messages
            render :edit
        end
    end

    def destroy
        @album = Album.find_by(id: params[:id])
        @album.destroy
        redirect_to band_url(@album.band_id)
        # want to redirect to the band that owned the album
    end

    private
    def album_params
        params.require(:album).permit(:name, :band_id, :year, :live)
    end


end
