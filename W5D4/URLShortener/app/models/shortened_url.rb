class ShortenedUrl < ApplicationRecord
  validates :short_url, presence: true, uniqueness: true
  validates :long_url, presence: true, uniqueness: true

  def self.random_code
    
    code = SecureRandom::urlsafe_base64

  end

end