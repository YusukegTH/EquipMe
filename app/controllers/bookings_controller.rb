class BookingsController < ApplicationController
  before_action :set_item
  before_action :set_booking, only: [:edit, :update, :destroy]

  def index
    @bookings = @item.bookings
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = @item.bookings.build(booking_params)
    if @booking.save
      redirect_to item_bookings_path(@item), notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to item_bookings_path(@item), notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to item_bookings_path(@item), notice: 'Booking was successfully deleted.'
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:booking_details)
  end
end
