class User < ApplicationRecord
  has_one :user_parameterization

  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
  validates :password, length: { minimum: 6 }, if: -> { password.present? }
  validates :number_phone, presence: true

  def authenticate_user(password)
    self.password == password ? true : false
  end
end
