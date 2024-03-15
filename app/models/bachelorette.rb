class Bachelorette < ApplicationRecord
  has_many :contestants
  
  validates :name, :season_number, :season_description, presence: true 
  validates :season_number, numericality: true 

  def avg_ages
    contestants.average(:age).to_f
  end
end
