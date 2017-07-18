class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all.paginate(page: params[:page], per_page:5)
  end

  def new
    @reservation = Reservation.new
    @listing = Listing.find(params[:listing_id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.save
    redirect_to listing_reservation_path(params[:listing_id], @reservation.id)
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def edit
    @listing = Listing.find(params[:listing_id])
    @reservation = Reservation.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:listing_id])
    @reservation = Reservation.find(params[:id])
    @reservation.update(reservation_params)
    @reservation.save
    redirect_to listing_reservation_path(params[:listing_id], @reservation.id)
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to listing_reservations_path
  end

  private
  def reservation_params
    params.require(:reservation).permit(:user_id, :listing_id, :check_in, :check_out)
  end

end
