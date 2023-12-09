FactoryBot.define do
  factory :post do
    title { 'Sample Title' }
    association :author, factory: :user
  end
end
