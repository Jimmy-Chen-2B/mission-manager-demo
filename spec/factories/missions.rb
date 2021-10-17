FactoryBot.define do
  factory :mission do
    title { Faker::Name.name }
    description { Faker::Lorem.paragraph(sentence_count: 4) }
    start_at { Faker::Date.between(from: '2021-09-01', to: '2021-09-30') }
    finish_at { Faker::Date.between(from: '2021-10-01', to: '2021-10-31') }
  end
end
