class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  def index
    # @bookings = Booking.where(user: current_user)
    if params[:query].present?
      sql_query = "planets.name @@ :query OR spaceships.name @@ :query"
      @bookings = policy_scope(Booking).joins(:planet).joins(:spaceship).where(sql_query, query: "%#{params[:query]}%")
    else
      @bookings = policy_scope(Booking)
    end
  end

  def show
    authorize @booking
  end

  def new
    @booking = Booking.new
    @spaceships = Spaceship.all
    @planets = Planet.all
    authorize @booking
  end

  def create
    @booking = Booking.create(
      user: current_user,
      spaceship: Spaceship.find(booking_params[:spaceship]),
      planet: Planet.find(booking_params[:planet])
    )
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      # flash[:error] = "Unable to create new booking."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @booking
    @spaceships = Spaceship.all
    @planets = Planet.all
  end

  def update
    authorize @booking
    @booking.update(
      user: current_user,
      spaceship: Spaceship.find(booking_params[:spaceship]),
      planet: Planet.find(booking_params[:planet])
    )
    if @booking.save
      redirect_to booking_path(@booking)
    else
      # flash[:error] = "Unable to update booking."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:spaceship, :planet, :user)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
