require 'rails_helper'

RSpec.describe 'Outings Show Page' do 
  describe 'Outings' do 
    it 'has a show page' do 
      bach = Bachelorette.create!(name: 'Hillary Turner', season_number: 20, season_description: 'No wait, THIS is the most dramatic season yet!')

      loki = Contestant.create!(name: 'Loki', age: 32, hometown: 'Evansville, IN', bachelorette_id: bach.id)
      karl = Contestant.create!(name: 'Karl', age: 21, hometown: 'Evansville, IN', bachelorette_id: bach.id)
      nova = Contestant.create!(name: 'Nova', age: 32, hometown: 'Henderson, KY', bachelorette_id: bach.id)

      helo = Outing.create!(event: 'Helicopter Ride', location: 'Jade Cove Canyon', date: '4/2/24')

      ContestantOuting.create!(contestant_id: loki.id, outing_id: helo.id)
      ContestantOuting.create!(contestant_id: karl.id, outing_id: helo.id)
      ContestantOuting.create!(contestant_id: nova.id, outing_id: helo.id)

      visit outing_path(helo)

      expect(page).to have_content(helo.event)
      expect(page).to have_content("Location: #{helo.location}")
      expect(page).to have_content("Date: #{helo.date}")
      expect(page).to have_content('Count of Contestants: 3')
      expect(page).to have_content('Contestants:')
      expect(page).to have_content(loki.name)
      expect(page).to have_content(karl.name)
      expect(page).to have_content(nova.name)
    end
  end
end