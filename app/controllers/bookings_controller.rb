class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy, :change_status]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def show
  end

  def edit
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking), notice: 'Booking succesfully created.'
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
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :accepted)
  end

end

