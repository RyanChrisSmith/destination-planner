class Weather
  attr_reader :location,
              :date,
              :low_temp,
              :high_temp,
              :summary

  def initialize(weather_data)
    @location = weather_data[:name]
    @date = Date.today
    @low_temp = weather_data[:main][:temp_min]
    @high_temp = weather_data[:main][:temp_max]
    @summary = weather_data[:weather][0][:description]
  end
end

