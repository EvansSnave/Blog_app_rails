# spec/models/like_spec.rb
require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post, author: user) }

  it 'updates likes counter after creation' do
    Like.create!(post: post, user: user)
    post.reload
    expect(post.likes_counter).to eq(1)
  end
end
