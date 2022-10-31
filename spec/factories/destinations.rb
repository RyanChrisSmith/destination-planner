FactoryBot.define do
  factory :destination do
    name { Faker::TvShows::GameOfThrones.city}
    zip { Faker::Address.zip }
    description { Faker::Lorem.sentence }
    image_url { Faker::Placeholdit.image }
  end
end
