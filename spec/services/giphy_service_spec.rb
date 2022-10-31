require 'rails_helper'

RSpec.describe GiphyService do 
  it 'will return a random image related to the current weather description' do 
    response = GiphyService.search_by_condition("light rain and snow")

    expect(response[:data][0][:images][:original]).to have_key(:url)
  end
end