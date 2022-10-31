class WeatherService 
  def self.conn
    Faraday.new(url: 'https://api.openweathermap.org') do |f|
      f.params['appid'] = ENV['api_key']
    end
  end

  def self.search_by_city(city)
    response = conn.get("/data/2.5/weather?q=#{city}&units=imperial")
    JSON.parse(response.body, symbolize_names: true)
  end
end