class Bachelorette < ApplicationRecord
  has_many :contestants
  
  validates :name, :season_number, presence: true 
  validates :season_number, numericality: true 

end
