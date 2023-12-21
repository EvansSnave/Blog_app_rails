require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET #index' do
    before { get users_path }

    it 'returns a success response' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'includes placeholder text' do
      expect(response.body).to include('Users List')
    end
  end

  describe 'GET #show' do
    let(:user) { FactoryBot.create(:user) }

    before { get user_path(user) }

    it 'returns a success response' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end
  end
end
