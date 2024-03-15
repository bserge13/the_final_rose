class Contestant < ApplicationRecord
  belongs_to :bachelorette
  validates :name, :hometown, presence: true
  validates :age, numericality: true 

end
