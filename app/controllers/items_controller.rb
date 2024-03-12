class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
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
      redirect_to @item, notice: "Item was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    item = Item.find(params[:id])
    item.delete_with_associations
    redirect_to items_path, notice: "Item deleted successfully"
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :picture, :availability)
  end
end
