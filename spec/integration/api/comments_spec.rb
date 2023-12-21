# spec/integration/api/v1/comments_spec.rb

require 'swagger_helper'

describe 'API V1 Comments', swagger_doc: 'v1/swagger.json' do
  path '/api/v1/users/{user_id}/posts/{post_id}/comments' do
    get 'Retrieve comments' do
      tags 'Comments'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :integer
      parameter name: :post_id, in: :path, type: :integer

      response '200', 'Comments retrieved' do
        schema type: :array, items: { '$ref' => '#/definitions/Comment' }

        run_test!
      end

      post 'Create a Comment' do
        tags 'Comments'
        consumes 'application/json'
        produces 'application/json'
        parameter name: :user_id, in: :path, type: :integer
        parameter name: :post_id, in: :path, type: :integer
        parameter name: :comment, in: :body, schema: {
          type: :object,
          properties: {
            text: { type: :string }
          },
          required: ['text']
        }

        response '201', 'Comment created' do
          let(:comment) { { text: 'Nice post!' } }

          run_test!
        end

        response '422', 'Invalid request' do
          let(:comment) { { text: '' } }

          run_test!
        end
      end
    end
  end
end
