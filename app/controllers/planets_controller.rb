class PlanetsController < ApplicationController
  def index
    @planets = Planet.all
  end

  def show
    @planet = Planet.find(params[:id])
  end

  def new
    @planet = Planet.new
  end

  def create
    @planet = Planet.create(planet_params)
    if @planet.save
      redirect_to planets_path
    else
      flash[:error] = "Unable to create new planet"
    end
  end

  private

  def planet_params
    params.require(:planet).permit(:name, :distance, photos: [])
  end
end
