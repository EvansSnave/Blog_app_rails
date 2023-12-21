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
create app/helpers/comment_deletions_helper.rb
module CommentDeletionsHelper
end
create app/helpers/post_deletions_helper.rb
module PostDeletionsHelper
end
create app/models/ability.rb
class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role == 'admin'
      can :manage, :all
    else
      can :destroy, Post, author_id: user.id
      can :destroy, Comment, author_id: user.id
      can :create, Comment, author_id: user.id
      can :create, Like, author_id: user.id
    end
  end
end
create a migration called _add_role_to_users.rb
class AddRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :string
  end
end
create spec/helpers/comment_deletions_helper_spec.rb
require 'rails_helper'
# Specs in this file have access to a helper object that includes
# the CommentDeletionsHelper. For example:
#
# describe CommentDeletionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe CommentDeletionsHelper, type: :helper do
  pending "add some examples to (or delete) #{__FILE__}"
end
create spec/helpers/post_deletions_helper_spec.rb
require 'rails_helper'
# Specs in this file have access to a helper object that includes
# the PostDeletionsHelper. For example:
#
# describe PostDeletionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PostDeletionsHelper, type: :helper do
  pending "add some examples to (or delete) #{__FILE__}"
end
create spec/requests/comment_deletions_spec.rb
require 'rails_helper'
RSpec.describe 'CommentDeletions', type: :request do
  describe 'GET /index' do
    pending "add some examples (or delete) #{__FILE__}"
  end
end
create spec/requests/post_deletions_spec.rb
require 'rails_helper'
RSpec.describe 'PostDeletions', type: :request do
  describe 'GET /index' do
    pending "add some examples (or delete) #{__FILE__}"
  end
end
