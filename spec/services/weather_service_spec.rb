require 'rails_helper'

RSpec.describe 'Weather API' do
  describe 'Weather services' do
    it 'gets current weather info' do
      response = WeatherService.search_by_city('Denver')

      expect(response).to be_a(Hash)
      expect(response[:main]).to be_a(Hash)
      expect(response[:name]).to eq('Denver')
    end
  end
end