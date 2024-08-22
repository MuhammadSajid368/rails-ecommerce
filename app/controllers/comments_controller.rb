class CommentsController < ApplicationController
  before_action :find_product
  before_action :find_comment, only: [:reply, :destroy]

  def create
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:success] = 'Comment added successfully.'
    else
      flash[:danger] = 'Failed to add comment.'
    end
    redirect_to @product
  end

  def reply
    @reply = @comment.replies.new(comment_params)
    @reply.user = current_user
    if @reply.save
      flash[:success] = 'Reply added successfully.'
    else
      flash[:danger] = 'Failed to add reply.'
    end
    redirect_to @product
  end

  def destroy
    @comment.destroy
    flash[:success] = 'Comment deleted successfully.'
    redirect_to @product
  end

  private

  def find_product
    @product = Product.find(params[:product_id])
  end

  def find_comment
    @comment = @product.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :parent_id)
  end
  
end