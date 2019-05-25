FactoryBot.define do
  factory :short_url do
    url { Faker::Internet.unique.url }
  end
end