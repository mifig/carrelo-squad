class Article < ApplicationRecord
  belongs_to :actor

  # has_one_attached :photo
end
