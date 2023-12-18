# spec/features/post_show_spec.rb
require 'rails_helper'

RSpec.feature 'Post Show', type: :feature do
  let(:user) { create(:user) }
  let(:post) { create(:post, author: user) }
  let!(:comments) { create_list(:comment, 3, post: post) }

  before do
    visit user_post_path(user, post)
  end

  scenario "seeing post's title" do
    expect(page).to have_content(post.title)
  end

  scenario "seeing post's author name" do
    expect(page).to have_content(user.name)
  end

  scenario 'seeing the number of comments for the post' do
    expect(page).to have_content("#{post.comments_counter} comments")
  end

  scenario 'seeing the number of likes for the post' do
    expect(page).to have_content("#{post.likes_counter} likes")
  end

  scenario 'seeing post body' do
    expect(page).to have_content(post.text) if post.text.present?
  end

  scenario 'seeing the usernames of each commentor and their comments' do
    comments.each do |comment|
      expect(page).to have_content(comment.author.name)
      expect(page).to have_content(comment.text)
    end
  end
end
