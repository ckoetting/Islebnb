class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy, :calculate_rating]

  def index
    if params[:search_by_title_and_price].nil? || params[:search_by_title_and_price].empty?
      @listings = Listing.all
    else
      @listings = Listing.search_by_title_and_price(params[:search_by_title_and_price])
    end
  end


  def show
    listing = @listing.geocode
    @markers = [{
      lat: @listing.latitude,
      lng: @listing.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { listing: listing })
    }]
    @rating = calculate_rating
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    if @listing.save
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  def destroy
    @listing.destroy
    redirect_to listings_path
  end

  def edit
  end

  def update
    @listing.update(listing_params)
    redirect_to listing_path(@listing)
  end

  # custom rating calculation on show listing page
  def calculate_rating
    total = 0.0
    n = 0
    unless @listing.reviews == []
      @listing.reviews.each do |r|
        total += r.stars
        n += 1
      end
      total = total / n
      return "⭐️ #{total.round(2)}"
    else
      return "No review yet"
    end
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:title, :description, :price, :bedrooms, :bathrooms, :house_type, :max_guests, :address, photos: [])
  end

end
