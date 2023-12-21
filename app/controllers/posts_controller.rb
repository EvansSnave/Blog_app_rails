class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:likes, { comments: :author }).paginate(page: params[:page], per_page: 3)
    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.includes(:likes, { comments: :author }).find(params[:id])
    @recent_comments = @post.five_recent_comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path, notice: 'Post created successfully'
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    authorize! :destroy, @post
    @post = @user.posts.find(params[:id])
    @post.destroy
    redirect_to user_posts_path(@user), notice: 'Post deleted!'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
