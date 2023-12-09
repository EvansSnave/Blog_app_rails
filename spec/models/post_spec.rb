require 'rails_helper'

RSpec.describe Post, type: :model do
  # Move this to the top so it's available to all specs within the block
  let(:user) do
    User.create(name: 'John', posts_counter: 2)
  end
  it 'is valid with valid attributes' do
    post = Post.new(title: 'Sample Title', author: user)
    expect(post).to be_valid
  end

  it 'is not valid without a title' do
    post = Post.new(title: nil)
    expect(post).to_not be_valid
  end

  it 'is not valid with a comments_counter less than 0' do
    post = build(:post, author: user, comments_counter: -1)
    expect(post).to_not be_valid
  end

  it 'is not valid with a likes_counter less than 0' do
    post = build(:post, author: user, likes_counter: -1)
    expect(post).to_not be_valid
  end

  describe '#update_posts_counter!' do
    let(:post) { create(:post, author: user) }

    it 'updates the posts_counter of the author' do
      post.update_posts_counter!
      expect(user.posts_counter).to eq(1)
    end
  end

  describe '#five_recent_comments' do
    let(:post) { create(:post, author: user) }

    it 'returns the five most recent comments' do
      old_comment = create(:comment, post: post, created_at: 6.days.ago)
      recent_comments = create_list(:comment, 5, post: post)

      expect(post.five_recent_comments).to eq(recent_comments.reverse)
      expect(post.five_recent_comments).not_to include(old_comment)
    end
  end
end
