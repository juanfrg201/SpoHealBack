class JsonWebToken
  SECRET_KEY = Rails.application.secret_key_base
  EXPIRATION_TIME = 1.day.from_now.to_i # Usar from_now aquí

  def self.encode(payload)
    payload[:exp] = EXPIRATION_TIME
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    JWT.decode(token, SECRET_KEY)[0]
  rescue JWT::ExpiredSignature, JWT::DecodeError
    nil
  end
end