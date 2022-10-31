class DestinationWeather
  attr_reader :location, :date, :low_temp, :high_temp, :summary, :url

  def initialize(data)
    @location = data[:name]
    @date = Date.today
    @low_temp = data[:main][:temp_min]
    @high_temp = data[:main][:temp_max]
    @summary = data[:weather][0][:description]
    @url = data[:data][0][:images][:original][:url]
  end
end