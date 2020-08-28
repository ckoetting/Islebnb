class UsersController < ApplicationController
  def show 
    @user = User.find(params[:id])
  end
  
  def my_booking_requests
    @my_booking_requests = []
    current_user.listings.each do |listing|
      listing.bookings.each do |l|
        @my_booking_requests << l
      end
    end
  end

  def my_listings
    @my_listings = current_user.listings
  end

  def my_bookings
    @my_bookings = current_user.bookings
  end
end
