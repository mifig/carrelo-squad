class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one_attached :cast_pdf
  has_one_attached :photo

  validates :email, :bio, :bio_en, :about, :about_en, presence: true
end
