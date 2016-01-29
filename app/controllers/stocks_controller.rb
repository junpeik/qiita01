class StocksController < ApplicationController
  before_action :set_item

  def create
    @stock = @item.stocks.build
    @stock.user = current_user
    @stock.save
    respond_to do |format|
      format.html { redirect_to user_item_path(current_user, @item) }
      format.js
    end
  end

  def destroy
    Stock.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to user_item_path(current_user, @item) }
      format.js
    end
  end

  private

    def set_item
      @item = Item.find(params[:item_id])
    end
end
