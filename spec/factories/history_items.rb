FactoryBot.define do
  factory :history_item do
    action { Faker::Lorem.sentence }
    project
  end
end
