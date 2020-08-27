class ListingsController < ApplicationController
  def index
    if params[:search_by_title_and_price].nil? || params[:search_by_title_and_price].empty?
      @listings = Listing.all
    else
      @listings = Listing.search_by_title_and_price(params[:search_by_title_and_price])
    end
  end
  

  def show
    @listing = Listing.find(params[:id])
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
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to listings_path
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)
    redirect_to listing_path(@listing)
  end

  private

  def listing_params
    params.require(:listing).permit(:title, :description, :price, :bedrooms, :bathrooms, :house_type, :max_guests, :address, photos: [])
  end

end
