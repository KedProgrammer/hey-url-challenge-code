# frozen_string_literal: true

class Url < ApplicationRecord
  # scope :latest, -> {}
  has_many :clicks, dependent: :destroy
  REGEX = /\A\w{1,5}\z/
  URL_REGEX = /http:\/\/\www\.\w+\.\w{3}\z/
  before_validation :generate_short_url
  validates :original_url, format: { with: URL_REGEX, message: 'You provided invalid URL' }
  validates :short_url, length: { maximum: 5 }
  validates :short_url, :original_url, presence: true
  validates :original_url, :short_url, uniqueness: true
  validates :short_url, format: { with: REGEX, message: 'short url has invalid characters' }

  private

  def generate_short_url
    self.short_url = [('A'..'Z').to_a, ('a'..'z').to_a, (0..9).to_a].flatten.sample(5).join
  end
end
