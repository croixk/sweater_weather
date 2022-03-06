class BackgroundsSerializer
  include JSONAPI::Serializer

  def self.background(data)
    hash = {
      data: {
        type: "image",
        id: nil,
        attributes: {
          image: {
            location: data[:photos][0][:url],
            image_url: data[:photos][0][:src][:original],
            credit: {
              photographer: data[:photos][0][:photographer],
              photographer_url: data[:photos][0][:photographer_url],
              photographer_id: data[:photos][0][:photographer_id]
            }
          }
        }
      }
    }
  end
end
