# spec/models/comment_spec.rb
require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post, author: user) }

  it 'updates comments counter after creation' do
    Comment.create!(text: 'Nice post!', post: post, author: user)
    post.reload
    expect(post.comments_counter).to eq(1)
  end
end
