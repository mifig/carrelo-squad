class Actor < ApplicationRecord
  has_many :links, dependent: :destroy
  has_many :socials, through: :links

  has_one_attached :primary_photo
  has_many_attached :photos
  has_one_attached :cv

  def to_param
    "#{first_name}-#{last_name}"
  end
end
