# spec/swagger_helper.rb

require 'rails_helper'

RSpec.configure do |config|
  config.swagger_root = "#{Rails.root}/swagger"
  config.swagger_docs = {
    'v1/swagger.json' => {
      openapi: '3.0.0',
      info: {
        title: 'API V1',
        version: 'v1',
        description: 'Descripción de tu API'
      },
      paths: {},
      servers: [
        {
          url: 'http://{defaultHost}',
          variables: {
            defaultHost: {
              default: 'www.example.com'
            }
          }
        }
      ],
      components: {
        schemas: {
          Post: {
            type: :object,
            properties: {
              id: { type: :integer },
              title: { type: :string },
              text: { type: :string }
            },
            required: %w[id title text]
          },
          Comment: {
            type: :object,
            properties: {
              id: { type: :integer },
              text: { type: :string },
              author: { type: :string }
            },
            required: %w[id text author]
          }
        }
      }
    }
  }
end
