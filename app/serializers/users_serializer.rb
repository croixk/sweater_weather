class UsersSerializer
  include JSONAPI::Serializer

  def self.user_return(user)
    hash = {
      data: {
        type: "users",
        id: user.id,
        attributes: {
          email: user[:email],
          api_key: user[:api_key]
        }
      }
    }
  end
end
