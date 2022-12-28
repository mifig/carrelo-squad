class Actor < ApplicationRecord
  has_many :links, dependent: :destroy
  has_many :socials, through: :links

  has_one_attached :primary_photo
  has_many_attached :photos
  has_one_attached :cv

  validates :first_name, :last_name, :bio, :height, :hair, :eyes, :primary_photo, presence: true
  validates :first_name, uniqueness: { scope: :last_name }
  validates :email, uniqueness: true
  validates :phone_number, uniqueness: true

  def to_param
    "#{first_name}-#{last_name}"
  end
end
