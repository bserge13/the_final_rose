class Outing < ApplicationRecord
  has_many :contestant_outings
  has_many :contestants, through: :contestant_outings

  validates :event, :location, :date, presence: true

  def contestant_count
    contestants.count
  end

end