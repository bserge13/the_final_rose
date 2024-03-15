require "rails_helper"

RSpec.describe Contestant, type: :model do
  describe "relationships" do
    it { should belong_to :bachelorette }
    it { should have_many :contestant_outings }
    it { should have_many(:outings).through(:contestant_outings) }
  end

  describe "validations" do 
    it { should validate_presence_of :name }
    it { should validate_presence_of :hometown }
    it { should validate_presence_of :age }
    it { should validate_numericality_of :age }
  end

  describe "instance methods" do
    it '#contestant_count' do 
    bach = Bachelorette.create!(name: 'Hillary Turner', season_number: 20, season_description: 'No wait, THIS is the most dramatic season yet!')

    loki = Contestant.create!(name: 'Loki', age: 32, hometown: 'Evansville, IN', bachelorette_id: bach.id)
    karl = Contestant.create!(name: 'Karl', age: 21, hometown: 'Evansville, IN', bachelorette_id: bach.id)
    nova = Contestant.create!(name: 'Nova', age: 32, hometown: 'Henderson, KY', bachelorette_id: bach.id)

    helo = Outing.create!(event: 'Helicopter Ride', location: 'Jade Cove Canyon', date: '4/2/24')

    ContestantOuting.create!(contestant_id: loki.id, outing_id: helo.id)
    ContestantOuting.create!(contestant_id: karl.id, outing_id: helo.id)
    ContestantOuting.create!(contestant_id: nova.id, outing_id: helo.id)

    expect(helo.contestant_count).to eq(3)
    end
  end
end
