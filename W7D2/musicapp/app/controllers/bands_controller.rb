class BandsController < ApplicationController
    before_action :require_logged_in

    def index
        @bands = Band.all
        render :index 
    end

    def create
        @band = Band.new(band_params)
        if @band.save
            redirect_to band_url(@band)
            # if its successfully created, we want to redirect to band's show page
        else
            flash.now[:errors] = @band.errors.full_messages
            render :new
        end
    end

    def new
        @band = Band.new
        render :new 
    end

    def show
        @band = Band.find_by(id: params[:id])
        render :show 
    end

    def edit
        @band = Band.find_by(id: params[:id])
        render :edit 
    end

    def update
        @band = Band.find_by(id: params[:id])
        if @band.update(band_params)
            redirect_to band_url(@band)
        else
            flash.now[:errors] = @band.errors.full_messages
            render :edit
        end
    end

    def destroy
        @band = Band.find_by(id: params[:id])
        @band.destroy
        redirect_to bands_url 
        # redirects to the index page of band 
    end

    private
    def band_params
        params.require(:band).permit(:name)
    end
end
