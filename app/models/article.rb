class Article < ApplicationRecord
  belongs_to :actor
  has_one_attached :image
  has_one_attached :pdf

  validates :url_image_present, presence: true, unless: :pdf?

  def url_image_present
    url.present? && image.present?
  end

  def pdf?
    pdf.present?
  end
end
