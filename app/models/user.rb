class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
  validates :password, length: { minimum: 6 }, if: -> { password.present? }

  def authenticate_user(password)
    self.password == password ? true : false
  end
end
