class ReviewsController < ApplicationController
  def new
    @listing = Listing.find(params[:listing_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @listing = Listing.find(params[:listing_id])
    @review.listing = @listing
    if @review.save
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  def edit
    review = Review.find(params[:id])
  end

    # PATCH/PUT review/1
  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to @review, notice: 'Review succesfully updated.'
    else
      render :edit
    end
  end

  def destroy
    review = Review.find(params[:id])
    listing = review.listing
    review.destroy
    redirect_to listing_path(listing)
  end

  private

  def review_params
    params.require(:review).permit(:description, :stars)
  end
end
