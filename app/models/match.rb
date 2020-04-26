class Match < ApplicationRecord
  has_many :games
  has_many :players, through: :games
  belongs_to :tournament
  attr_accessor :firstPlayer
  attr_accessor :secondPlayer
  attr_accessor :thirdPlayer
  attr_accessor :fourthPlayer
end
