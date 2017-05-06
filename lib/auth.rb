class Auth

  def self.create_token(user_id)
    payload = { user_id: user_id }
    JWT.encode(payload, ENV['AUTH_SECRET'], ENV['AUTH_ALGORITHM'])

    request : header -> "Authorization": "Bearer: 2425235235523"
  end
end
