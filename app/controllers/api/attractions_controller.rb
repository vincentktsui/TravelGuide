class Api::AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all
        @attractions = Attraction.in_bounds(params[:filters][:bounds])
        render :index
    end

    def show
        # debugger
        @attraction = Attraction.find_by(id: params[:id])
        if @attraction.nil?
            render json: ['Attraction does not exist'], status: 404 
        else
            lat = @attraction.coordinates.y
            lng = @attraction.coordinates.x
            @nearby = Attraction.radius(lng, lat, params[:id])
            render :show
        end
    end

    def create
        @attraction = Attraction.new(attraction_params)
        if @attraction.save
        else
            render json: @attraction.errors.full_messages, status: 422
        end
    end

    private
    def attraction_params
        params.require(:attraction).permit(:about, :name, :country, :lat, :lng,
            :administrative_area, :locality, :postal_code, :thoroughfare)
    end
end