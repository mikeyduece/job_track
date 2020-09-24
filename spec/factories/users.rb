FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.unique.email }
    auth0_id { nil }
    
  end
  
  factory :user_with_apps, parent: :user do
    after(:create) do |user, _evaluator|
      create_list(:job_application, 3, user: user)
    end
  end
end
