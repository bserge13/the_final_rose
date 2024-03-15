require 'rails_helper'

RSpec.describe 'Bachelorette Show and Index page' do 
  describe 'Bachelorette' do 
    it 'has a show page' do 
      bach = Bachelorette.create!(name: 'Hannah Brown', season_number: 15, season_description: 'The Most Dramatic Season Yet!')

      loki = Contestant.create!(name: 'Loki', age: 28, hometown: 'Evansville, IN', bachelorette_id: bach.id)

      visit bachelorette_path(bach) 
      
      expect(page).to have_content(bach.name)
      expect(page).to have_content("Season #{bach.season_number} - #{bach.season_description}")

      expect(page).to have_link("Season #{bach.season_number} Contestants")

      click_link("Season #{bach.season_number} Contestants")
      expect(current_path).to eq(bachelorette_contestants_path(bach))
    end
  end
end