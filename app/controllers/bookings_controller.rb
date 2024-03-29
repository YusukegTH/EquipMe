class BookingsController < ApplicationController
  before_action :set_item, only: %i[index new create]
  before_action :set_booking, only: %i[edit update destroy]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.item = @item
    if @booking.save
      redirect_to user_path(current_user), notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to user_path(current_user), notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to user_path(current_user), notice: 'Booking was successfully deleted.'
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
