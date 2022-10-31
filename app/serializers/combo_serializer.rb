class ComboSerializer
  include JSONAPI::Serializer
  attributes :date, :high_temp, :low_temp, :location, :summary, :url
end
