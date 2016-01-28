class Users::ItemsController < ApplicationController
  before_action :set_item, except: :show

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to user_item_path(current_user, @item)
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to root_url
  end

  private

    def set_item
      @item = current_user.items.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:title, :body)
    end
end
