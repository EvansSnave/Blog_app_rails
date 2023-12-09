require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(name: 'John', posts_counter: 2)
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = User.new(name: nil)
    expect(user).to_not be_valid
  end

  it 'has a posts_counter greater than or equal to 0' do
    user = User.new(posts_counter: -1)
    expect(user).to_not be_valid
  end

  describe '#three_recent_posts' do
    let(:user) { create(:user, name: 'John', posts_counter: 2) }

    it 'returns the three most recent posts' do
      old_post = create(:post, author: user, created_at: 3.days.ago)
      recent_posts = create_list(:post, 3, author: user)

      expect(user.three_recent_posts).to eq(recent_posts.reverse)
      expect(user.three_recent_posts).not_to include(old_post)
    end
  end
end
