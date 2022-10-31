class WeatherFacade 
  def self.get_current_weather(city)
    weather_data = WeatherService.search_by_city(city)
    @weather = Weather.new(weather_data)
  end
end