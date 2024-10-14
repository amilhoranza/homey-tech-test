FactoryBot.define do
  factory :project do
    name { Faker::Company.name }
    status { Project.statuses.keys.sample }
  end
end
