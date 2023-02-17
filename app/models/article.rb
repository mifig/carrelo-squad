class Article < ApplicationRecord
  belongs_to :actor
  has_one_attached :image
  has_one_attached :pdf

  # validates_presence_of :url, unless: :pdf?
  # validates :url, uniqueness: true

  def pdf?
    pdf.attached?
  end
end
