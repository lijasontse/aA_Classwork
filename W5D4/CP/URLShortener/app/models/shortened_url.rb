# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'securerandom'

class ShortenedUrl < ApplicationRecord
  validates :long_url, :user_id, presence: true
  validates :short_url, presence: true, uniqueness: true

  def self.random_code
    short = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(short)
      short = SecureRandom.urlsafe_base64
    end
    short
  end

  def self.create_shortened_url(user,long_url)
    ShortenedUrl.create!(long_url: long_url, short_url: ShortenedUrl.random_code, user_id: user.id)

  end

  belongs_to :submitter,
    foreign_key: :user_id,
    class_name: :User
end
