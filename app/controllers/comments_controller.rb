class CommentsController < ApplicationController
  before_action :set_item

  def create
    @comment = @item.comments.build(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to user_item_path(current_user, @item)
  end

  private

    def set_item
      @item = Item.find(params[:item_id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end
