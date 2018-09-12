class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      flas[:notice] = "Item was saved."
      redirect_to [@item.current_user, @item]
    else
      flash.now[:alert] = "Error creating item. Please try again later."
      render :new
    end
  end


  private
  def item_params
    params.require(:item).permit(:name)
end
end
