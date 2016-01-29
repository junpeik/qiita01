class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def private_items
    @items = current_user.items.all
  end
end
