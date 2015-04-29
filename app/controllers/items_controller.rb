class ItemsController < ApplicationController

  before_action :authenticate_user!

  def create
    @item = Item.new(item_params) do |item|
      item.list_id = params[:list_id]
      item.user = current_user
    end
    @item.save
    respond_to do |format|
      format.js
    end
  end

  def update
  end

  def destroy
    @item = Item.find(params[:id])
    @item_id = @item.id
    respond_to do |format|
      format.js
    end
  end

  private
  def item_params
    params.require(:item).permit(:name)
  end
end
