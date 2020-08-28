class ReviewsController < ApplicationController
  def new
    @listing = Listing.find(params[:listing_id])
    @user = current_user
    @review = Review.new()
  end

  def create
    @review = Review.new(review_params)
    @user = current_user
    @listing = Listing.find(params[:listing_id])
    @review.listing = @listing
    @review.user_id = @user.id
    if @review.save
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  def index
    @reviews = Review.all
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
    params.require(:review).permit(:description, :stars, :user_id)
  end
end
