class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params) do |comment|
      comment.list_id = params[:list_id]
      comment.user = current_user
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment_id = @comment.id
    respond_to do |format|
      format.js
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
