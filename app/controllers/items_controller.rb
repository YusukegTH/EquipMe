class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:new, :index, :show]

  def index
    @items = Item.all
  end

  def show

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.availability = true
    @item.picture.attach(params[:item][:picture]) if params[:item][:picture]
    if @item.save
      redirect_to item_path(@item), notice: "Item was successfully created."
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.delete_with_associations
    redirect_to items_path, notice: "Item deleted successfully"
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :picture, :availability, :address, :location, :price, :category, :user_id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
