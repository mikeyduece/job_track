FactoryBot.define do
  factory :job_application do
    user
    position { 'Backend' }
    company { Faker::Company.industry }
  end
end