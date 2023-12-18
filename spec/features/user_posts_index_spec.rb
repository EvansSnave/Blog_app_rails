require 'rails_helper'

RSpec.feature "User's Posts Index", type: :feature do
  let(:user) do
    user = FactoryBot.create(:user)
    FactoryBot.create(:post, author: user)
    user.reload
    user
  end

  let!(:user_with_many_posts) do
    user = FactoryBot.create(:user)
    FactoryBot.create_list(:post, 12, author: user)
    user
  end

  before do
    visit user_posts_path(user)
  end

  scenario 'viewing all posts for a user' do
    user.posts.each do |post|
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.text&.truncate(100)) if post.text
      expect(page).to have_content("#{post.comments.count} comments")
      expect(page).to have_content("#{post.likes.count} likes")
    end
    expect(page).to have_content(user.name)
    expect(page).to have_selector("img[src$='path_to_default_profile_pic.jpg']")
    expect(page).to have_content("#{user.posts.count} posts")
  end

  scenario 'clicking on a post redirects to post show page' do
    first_post = user.posts.first
    click_on first_post.title, match: :first
    expect(current_path).to eq(user_post_path(user, first_post))
  end

  scenario 'pagination is present if there are more posts' do
    visit user_posts_path(user_with_many_posts)
    expect(page).to have_selector('.pagination')
  end

  scenario 'viewing post body for a user' do
    user.posts.each do |post|
      expect(page).to have_content(post.text&.truncate(100)) if post.text
    end
  end

  scenario 'viewing the first comments for a post' do
    user.posts.each do |post|
      post.comments.first(3).each do |comment|
        expect(page).to have_content(comment.body)
      end
    end
  end
end
