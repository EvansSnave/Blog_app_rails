FactoryBot.define do
  factory :user do
    name { 'John' }
    posts_counter { 0 }

    trait :with_posts do
      after(:create) do |user, _evaluator|
        create_list(:post, 3, author: user) # Use the `author` association
      end
    end
  end
end
