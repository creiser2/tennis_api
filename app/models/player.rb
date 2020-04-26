class Player < ApplicationRecord
  has_one :coach
  has_many :games
  has_many :matches, through: :games
end
