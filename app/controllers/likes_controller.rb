class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(user: current_user)
    return unless @like.save

    redirect_to user_post_path(@post.author, @post), notice: 'Liked!'
  end

  def destroy
    @post = Post.find(params[:id])
    @like = @post.likes.find_by(user: current_user)
    @like&.destroy
    redirect_to user_post_path(@post.author, @post), notice: 'Unliked!'
  end
end
