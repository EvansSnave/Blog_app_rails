class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @user = User.includes(posts: [:likes, { comments: :author }]).find(params[:id])
    @recent_posts = @user.three_recent_posts
  end
end
