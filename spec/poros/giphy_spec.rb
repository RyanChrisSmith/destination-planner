require 'rails_helper'

RSpec.describe Giphy do
  it 'will only grab the image needed' do
    data = GiphyService.search_by_condition("light rain and snow")

    final = Giphy.new(data)

    expect(final.url).to eq("https://media1.giphy.com/media/NEqxBcejKE68U/giphy.gif?cid=126966be92ttv49pxln4cn5yqrlx1o4uhqmp5hxhiqbs6r3r&rid=giphy.gif&ct=g")
  end
end