class Link < ApplicationRecord
  belongs_to :social, optional: true
  belongs_to :actor
end
