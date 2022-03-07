class SessionsSerializer
  include JSONAPI::Serializer

  def self.session_return(session)
    hash = {
      data: {
        type: "users",
        id: session[:user_id],
        attributes: {
          email: session[:email],
          api_key: session[:api_key]
        }
      }
    }
  end
end
