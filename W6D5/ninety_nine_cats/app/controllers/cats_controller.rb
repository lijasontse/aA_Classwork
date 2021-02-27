class CatsController < ApplicationController
    def index
        @cats = Cat.all
        render :index
    end

    def show
        @cat = Cat.find_by(id: params[:id])
        render :show 
    end


end

private

def cat_params
params.require(:cat).permit(:name, :birth_date, :age, :color, :sex, :description)
end