FactoryBot.define do
  factory :job_application do
    user
    company { Faker::Company.industry }
  end
end