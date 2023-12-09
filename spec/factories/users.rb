FactoryBot.define do
  factory :user do
    name { 'John' }
    posts_counter { 0 }
  end
end
