require 'rails_helper'

RSpec.describe 'Show and Index page' do 
  before :each do 
    @bach_1 = Bachelorette.create!(name: 'Hannah Brown', season_number: 15, season_description: 'The Most Dramatic Season Yet!')

    @loki = Contestant.create!(name: 'Loki', age: 28, hometown: 'Evansville, IN', bachelorette_id: @bach_1.id)
    @karl = Contestant.create!(name: 'Karl', age: 21, hometown: 'Evansville, IN', bachelorette_id: @bach_1.id)
  end
  describe 'Bachelorette' do 
    it 'has a show page' do 
      visit bachelorette_path(@bach_1) 
      
      expect(page).to have_content(@bach_1.name)
      expect(page).to have_content("Season #{@bach_1.season_number} - #{@bach_1.season_description}")

      expect(page).to have_link("Season #{@bach_1.season_number} Contestants")
      
    end
  end
end