class User < ApplicationRecord
  has_secure_password
  has_secure_token :password_reset_token

  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 100 },
                    format: { with: /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\z/, message: 'Invalid email address' }
end

# Generating a token:

def generate_token(user)
  # user = User.last
  user.regenerate_password_reset_token

  # add next line if you want it to be expirable
  user.password_reset_token_created_at = Time.zone.now

  user.save!
end

# Finding by token:
# def find_by_token(token)
#   User.find_by(password_reset_token: token)
# end

# Finding by token if it is expirable
def find_by_token(token)
  User.where(
    'password_reset_token = ? AND password_reset_token_created_at >= ?',
    token,
    15.minutes.ago # expiration time
  ).first
end
