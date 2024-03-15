require 'rails_helper'

RSpec.describe 'Contestant Show Page' do 
  describe 'Contestant' do
    it 'has a show page' do 
      bach = Bachelorette.create!(name: 'Hillary Turner', season_number: 20, season_description: 'No wait, THIS is the most dramatic season yet!')
  
      loki = Contestant.create!(name: 'Loki', age: 32, hometown: 'Evansville, IN', bachelorette_id: bach.id)
  
      ball = Outing.create!(event: 'Kickball', location: 'West Terrace', date: '3/17/24')
      springs = Outing.create!(event: 'Hot Springs', location: 'Hells Hot Springs', date: '3/25/24')
      helo = Outing.create!(event: 'Helicopter Ride', location: 'Jade Cove Canyon', date: '4/2/24')
  
      ContestantOuting.create!(contestant_id: loki.id, outing_id: ball.id)
      ContestantOuting.create!(contestant_id: loki.id, outing_id: springs.id)
      ContestantOuting.create!(contestant_id: loki.id, outing_id: helo.id)
  
      visit contestant_path(loki)
      
      expect(page).to have_content(loki.name)
      expect(page).to have_content("Season #{bach.season_number} - #{bach.season_description}")

      expect(page).to have_content('Outings')
      expect(page).to have_link(ball.event)
      expect(page).to have_link(springs.event)
      expect(page).to have_link(helo.event)

      click_link(helo.event)
      expect(current_path).to eq(outing_path(helo))
    end
  end
end