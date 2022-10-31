require 'rails_helper'

RSpec.describe 'destination weather API' do
  it 'sends the weather and image for a destination' do
    destination = Destination.create!(name: 'Littleton', zip: 80123,description: Faker::Lorem.sentence, image_url: Faker::Placeholdit.image)

    get "/api/v1/destinations/#{destination.name}/weather"
    destination = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(destination).to have_key(:location)
    expect(destination[:location]).to be_a(String)

    expect(destination).to have_key(:date)
    expect(destination[:date]).to be_a(String)

    expect(destination).to have_key(:low_temp)
    expect(destination[:low_temp]).to be_a(Float)

    expect(destination).to have_key(:high_temp)
    expect(destination[:high_temp]).to be_a(Float)

    expect(destination).to have_key(:summary)
    expect(destination[:summary]).to be_a(String)

    expect(destination).to have_key(:url)
    expect(destination[:url]).to be_a(String)
  end
end