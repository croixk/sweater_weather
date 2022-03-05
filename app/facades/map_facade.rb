class MapFacade
  def self.lat_long(location)
    json = MapService.get_lat_long(location)
    lat_long = json[:results][0][:locations][0][:latLng]
  end
end
