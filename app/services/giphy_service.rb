class GiphyService 
  def self.conn 
    Faraday.new(url: "https://api.giphy.com") do |f|
      f.params['api_key'] = ENV['giphy_key']
    end
  end

  def self.search_by_condition(summary)
    response = conn.get("/v1/gifs/search?q=#{summary}&limit=1&offset=0&rating=g&lang=en")
    JSON.parse(response.body, symbolize_names: true)
  end
end