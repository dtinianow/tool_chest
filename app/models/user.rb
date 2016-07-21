class User < ApplicationRecord
  has_secure_password
  has_many :tools

  enum role: %w(default admin)
end
