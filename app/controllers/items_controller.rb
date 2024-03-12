class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
  end

  def create
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
end
