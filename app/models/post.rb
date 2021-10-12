class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :comments
  validates :title, presence: true
  validates :body, presence: true, length: {minimum: 10}
end


