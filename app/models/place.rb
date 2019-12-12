class Place < ApplicationRecord
  belongs_to :parking
  belongs_to :driver
  scope :desc, -> { order(number: :desc) }
end
