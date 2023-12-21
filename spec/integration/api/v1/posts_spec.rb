# spec/integration/api/v1/posts_spec.rb

require 'swagger_helper'

describe 'API V1 Posts', swagger_doc: 'v1/swagger.json' do
  path '/api/v1/users/{user_id}/posts' do
    get 'Retrieve posts' do
      tags 'Posts'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :integer

      response '200', 'Posts retrieved' do
        schema type: :array, items: { '$ref' => '#/definitions/Post' }

        run_test!
      end
    end
  end
end
