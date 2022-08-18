class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @spaceships = Spaceship.all
    @planets = Planet.all
  end

  def create
    @booking = Booking.create(
      user: current_user,
      spaceship: Spaceship.find(booking_params[:spaceship]),
      planet: Planet.find(booking_params[:planet])
    )
    if @booking.save
      redirect_to bookings_path
    else
      flash[:error] = "Unable to create new booking."
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    @spaceships = Spaceship.all
    @planets = Planet.all
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(
      user: current_user,
      spaceship: Spaceship.find(booking_params[:spaceship]),
      planet: Planet.find(booking_params[:planet])
    )
    if @booking.save
      redirect_to booking_path(@booking)
    else
      flash[:error] = "Unable to update booking."
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:spaceship, :planet, :user)
  end
end
