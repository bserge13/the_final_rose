require 'rails_helper'

RSpec.describe 'Contestant Show Page' do 
  before :each do 
    @bach = Bachelorette.create!(name: 'Hillary Turner', season_number: 20, season_description: 'No wait, THIS is the most dramatic season yet!')

    @loki = Contestant.create!(name: 'Loki', age: 32, hometown: 'Evansville, IN', bachelorette_id: @bach.id)

    
  end

  describe 'Contestant' do
    it 'has a show page' do 
      visit contestant_path(@loki)
      
      expect(page).to have_content(@loki.name)
      expect(page).to have_content("Season #{@bach.season_number} - #{@bach.season_description}")

      expect(page).to have_content("")
    end
  end
end