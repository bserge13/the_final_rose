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
    before :each do 
      @bach = Bachelorette.create!(name: 'Hannah Brown', season_number: 15, season_description: 'The Most Dramatic Season Yet!')
        
      @loki = Contestant.create!(name: 'Loki', age: 28, hometown: 'Evansville, IN', bachelorette_id: @bach.id)
      @karl = Contestant.create!(name: 'Karl', age: 39, hometown: 'Evansville, IN', bachelorette_id: @bach.id)
      @nova = Contestant.create!(name: 'Nova', age: 32, hometown: 'Henderson, KY', bachelorette_id: @bach.id)

    end

    it '#avg_ages' do 
      expect(@bach.avg_ages).to eq(33.0)
    end

    it '#hometown_list' do 
      expect(@bach.hometown_list).to eq('Evansville, IN, Henderson, KY') 
    end
  end
end
