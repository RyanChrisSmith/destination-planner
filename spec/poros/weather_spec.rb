require 'rails_helper'

RSpec.describe 'POROS' do 
  it 'returns only the values needed from the api call' do
    @api_data = WeatherService.search_by_city('Denver')

    @weather = Weather.new(@api_data)

    expect(@weather.location).to eq('Denver')
    expect(@weather.date).to eq(Date.today)
    # expect(@weather.high_temp).to eq(39.27)
    # expect(@weather.low_temp).to eq()
    # expect(@weather.summary).to eq('overcast clouds')
  end
end