class User < ApplicationRecord
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }, if: -> { new_record? || !password.nil? }
end
