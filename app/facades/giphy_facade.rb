class GiphyFacade
  def self.image_request(summary)
    json = GiphyService.search_by_condition(summary)
    @url = Giphy.new(json)
  end
end