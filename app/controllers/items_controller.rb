class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = current_user.items.build
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to user_item_path(current_user, @item)
    else
      render 'new'
    end
  end

  private

    def item_params
      params.require(:item).permit(:title, :body)
    end
end
