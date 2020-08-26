class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy, :change_status]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    @listing = Listing.find(params[:listing_id])
  end

  def edit
  end

  def show
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.listing = Listing.find(params[:listing_id])
    if @booking.save
      redirect_to @booking.listing, notice: 'Booking succesfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT bookings/1
  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Booking succesfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  # Custom status action
  def change_status
    if @booking.accepted?
      @booking.accepted = false
    else
      @booking.accepted = true
    end
    @booking.save
    redirect_to my_booking_requests_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :accepted, :message, :full_name, :age, :address, :number_of_guests)
  end

end

