class Contestant < ApplicationRecord
  belongs_to :bachelorette
  
  validates :name, :hometown, :age, presence: true
  validates :age, numericality: true 

end
