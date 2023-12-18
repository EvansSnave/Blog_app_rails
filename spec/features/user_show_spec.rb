require 'rails_helper'

RSpec.feature 'User Show', type: :feature do
  let(:user) { create(:user) }
  let!(:first_post) { create(:post, author: user) }

  before do
    visit user_path(user)
  end

  scenario "viewing a user's details" do
    expect(page).to have_content(user.name)
    expect(page).to have_selector("img[src$='path_to_default_profile_pic.jpg']")
    expect(page).to have_content(user.bio) if user.bio
    expect(page).to have_content("#{user.posts.count} posts")
    user.posts.limit(3).each do |post|
      expect(page).to have_content(post.title)
    end
  end

  scenario 'clicking on a post redirects to post show page' do
    click_on first_post.title
    expect(current_path).to eq(user_post_path(user, first_post))
  end

  scenario 'clicking the view all posts button' do
    expect(page).to have_link('All posts', href: user_posts_path(user))

    click_on 'All posts'
    expect(current_path).to eq(user_posts_path(user))
  end
end
