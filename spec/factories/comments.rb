# spec/factories/comments.rb

FactoryBot.define do
  factory :comment do
    text { 'Sample Comment Content' }
    association :post
    association :author, factory: :user
  end
end
