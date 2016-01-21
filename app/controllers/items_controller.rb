class ItemsController < ApplicationController
  before_action :set_user, only: [:show, :new, :create, :edit, :update]

  def index
    @items = Item.all
  end

  def show
    @item = @user.items.find(params[:id])
  end

  def new
    @item = @user.items.build
  end

  def edit
    @item = @user.items.find(params[:id])
  end

  def create
    @item = @user.items.build(item_params)
    if @item.save
      redirect_to user_item_path(@user, @item)
    else
      render 'new'
    end
  end

  def update
    @item = @user.items.find(params[:id])
    if @item.update(item_params)
      redirect_to user_item_path(@user, @item)
    else
      render 'edit'
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
