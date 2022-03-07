class UsersSerializer
  include JSONAPI::Serializer

  def self.user_return(user)
    hash = {
      data: {
        type: "users",
        id: "1",
        attributes: {
          email: user[:email],
          api_key: user[:api_key]
        }
      }
    }
  end
end
