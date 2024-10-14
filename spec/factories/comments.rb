FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.sentence }
    project
  end
end
