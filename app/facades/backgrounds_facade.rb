class BackgroundsFacade
  def self.get_image(query)
    json = BackgroundsService.get_image(query)
  end
end
