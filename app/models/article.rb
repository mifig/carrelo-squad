class Article < ApplicationRecord
  belongs_to :actor
  has_one_attached :image

  validates :url, presence: true, uniqueness: true
end
