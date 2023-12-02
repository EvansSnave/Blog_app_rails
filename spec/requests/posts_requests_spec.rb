require 'rails_helper'

RSpec.describe PostsController, type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post, author: user) }

  describe 'GET #index' do
    before { get user_posts_path(user) }

    it 'returns a success response' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    before { get user_post_path(user, post) }

    it 'returns a success response' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'includes placeholder text' do
      expect(response.body).to include('Post Details')
    end
  end
end
