class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 100 },
                    format: { with: /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\z/, message: 'Invalid email address' }
end
