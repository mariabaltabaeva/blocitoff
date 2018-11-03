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
    @item.user = current_user

    if @item.save
      flash[:notice] = "Item was saved."
      redirect_to current_user
    else
      flash.now[:alert] = "Error creating item. Please try again later."
      render :new
    end
  end

  def destroy
     @item = Item.find(params[:id]).destroy
     respond_to do |format|
       format.js
     end
     redirect_to current_user
  end


  private
  def item_params
    params.require(:item).permit(:name)
end
end
