require 'rails_helper'

RSpec.describe 'Destinations Show page' do
  it 'will display current weather and its attributes' do
    @denver = Destination.create!(name: 'Littleton',zip: 80123, description: Faker::Lorem.sentence, image_url: Faker::Placeholdit.image)
    @weather = WeatherFacade.get_current_weather(@denver.name)

    visit destination_path(@denver)

    expect(page).to have_content(@weather.location)
    expect(page).to have_content(@weather.date.strftime("%A, %B %e"))
    expect(page).to have_content(@weather.low_temp)
    expect(page).to have_content(@weather.high_temp)
    expect(page).to have_content(@weather.summary)
  end

  it 'will show a related image to the current weather' do
    @denver = Destination.create!(name: 'Littleton',zip: 80123, description: Faker::Lorem.sentence, image_url: Faker::Placeholdit.image)
    @weather = WeatherFacade.get_current_weather(@denver.name)
    @image = GiphyFacade.image_request(@weather.summary)

    expect(page).to have_url(@image.url)
  end
end