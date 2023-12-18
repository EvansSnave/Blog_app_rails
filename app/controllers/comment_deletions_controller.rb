class CommentDeletionsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:comment_id]) # Modificar esta línea
    authorize! :destroy, @comment
    @comment.destroy
    redirect_to user_post_path(@post.author, @post), notice: 'Comment deleted!'
  end
end
