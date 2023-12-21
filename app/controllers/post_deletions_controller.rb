# post_deletions_controller.rb
class PostDeletionsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id]) # Cambia params[:id] a params[:post_id]
    authorize! :destroy, @post
    @post.destroy
    redirect_to user_posts_path(@user), notice: 'Post deleted!'
  end
end
