class Actor < ApplicationRecord
  has_many :links, dependent: :destroy
  has_many :socials, through: :links
  has_many :articles, dependent: :destroy

  has_one_attached :primary_photo
  has_many_attached :photos
  has_one_attached :pt_cv
  has_one_attached :en_cv

  validates :first_name, :last_name, :bio, :bio_en, :height, :hair, :hair_en, :eyes, :eyes_en, :primary_photo, presence: true
  validates :first_name, uniqueness: { scope: :last_name }
  validates :email, uniqueness: true
  validates :phone_number, uniqueness: true

  def to_param
    "#{first_name}-#{last_name}"
  end
end
