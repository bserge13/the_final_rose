require "rails_helper"

RSpec.describe Bachelorette, type: :model do
  describe "relationships" do
    it { should have_many :contestants }
  end

  describe "validations" do 
    it { should validate_presence_of :name }
    it { should validate_presence_of :season_description }
    it { should validate_presence_of :season_number }
    it { should validate_numericality_of :season_number }
  end

  describe 'Instance methods' do 
    it '#avg_ages' do 
    bach = Bachelorette.create!(name: 'Hannah Brown', season_number: 15, season_description: 'The Most Dramatic Season Yet!')
      
    loki = Contestant.create!(name: 'Loki', age: 28, hometown: 'Evansville, IN', bachelorette_id: bach.id)
    karl = Contestant.create!(name: 'Karl', age: 21, hometown: 'Evansville, IN', bachelorette_id: bach.id)

    expect(bach.avg_ages).to eq(24.5)
    end
  end
end
