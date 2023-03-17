class SpicesController < ApplicationController

    def index
        spices = Spice.all
        render json: spices
    end

    def create
        spices = Spice.create(spice_params)
        render json: spices, status: :created
    end

    def update
        spices = Spice.find_by(id: params[:id])
        spices.update(spice_params)
        render json: spices, status: :ok

    end

    def destroy
        spices = Spice.find_by(id: params[:id])
        spices.destroy
        head :no_content
    end



    private
    def spice_params
        params.permit(:title, :description, :image, :notes, :rating )
    end
end
