class Social < ApplicationRecord
  has_many :links, dependent: :destroy
  
  has_one_attached :logo
end
