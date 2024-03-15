class Bachelorette < ApplicationRecord
  has_many :contestants
  validates :name, presence: true 
  validates :season_number, numericality: true 
end
