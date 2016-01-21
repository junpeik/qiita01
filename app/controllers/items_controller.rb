class ItemsController < ApplicationController
  before_action :set_user, only: [:show, :new]

  def index
    @items = Item.all
  end

  def show
    @item = @user.items.find(params[:id])
  end

  def new
    @item = @user.items.build
  end

  def create
    @item = @user.items.buid(item_params)
    if @item.save

    else

    end
  end

  private

    def set_user
      @user = User.find(params[:user_id])
    end

    def item_params
      params.require(:item).permit(:title, :body)
    end
end
