class ListingsController < ApplicationController

  def index
    @listings = Listing.all.paginate(page: params[:page], per_page:5)
  end
  
  def new
    @listing = Listing.new
  end 

  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save
      redirect_to listings_path
    else
      redirect_to new_listing_path
    end
  end 

  def show
    @listing = Listing.find(params[:id])
  end


  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)
    redirect_to listings_path(@listing.id)
  end

  def destroy
    @listing = Listing.find(params[:id])
    if @listing.destroy
    redirect_to listings_path
    else
    redirect_to listings_path
    end 
  end


  private
  def listing_params
    params.require(:listing).permit(:name, :description, :price, {images: []})
  end

end


