require 'rails_helper'

RSpec.describe 'Outings Show Page' do 
  before :each do 
    @bach = Bachelorette.create!(name: 'Hillary Turner', season_number: 20, season_description: 'No wait, THIS is the most dramatic season yet!')

    @loki = Contestant.create!(name: 'Loki', age: 32, hometown: 'Evansville, IN', bachelorette_id: @bach.id)
    @karl = Contestant.create!(name: 'Karl', age: 21, hometown: 'Evansville, IN', bachelorette_id: @bach.id)
    @nova = Contestant.create!(name: 'Nova', age: 32, hometown: 'Henderson, KY', bachelorette_id: @bach.id)

    @helo = Outing.create!(event: 'Helicopter Ride', location: 'Jade Cove Canyon', date: '4/2/24')
    @kayak = Outing.create!(event: 'Kayaking', location: 'Willows Swallow', date: '4/4/24')

    ContestantOuting.create!(contestant_id: @loki.id, outing_id: @helo.id)
    ContestantOuting.create!(contestant_id: @karl.id, outing_id: @helo.id)
    ContestantOuting.create!(contestant_id: @nova.id, outing_id: @helo.id)
    ContestantOuting.create!(contestant_id: @karl.id, outing_id: @kayak.id)
  end

  describe 'Outings' do 
    it 'has a show page' do 
      visit outing_path(@helo)

      expect(page).to have_content(@helo.event)
      expect(page).to have_content("Location: #{@helo.location}")
      expect(page).to have_content("Date: #{@helo.date}")
      expect(page).to have_content('Count of Contestants: 3')
      expect(page).to have_content('Contestants:')
      expect(page).to have_content(@loki.name)
      expect(page).to have_content(@karl.name)
      expect(page).to have_content(@nova.name)

      expect(page).to have_button('Remove')
    end

    it 'can remove a contestant from one outing but not another' do 
      visit outing_path(@helo)
      expect(page).to have_content(@karl.name) 
      
      within "#contestant-#{@karl.id}" do 
        click_button('Remove')
      end

      expect(current_path).to eq(outing_path(@helo))
      expect(page).to_not have_content(@karl.name)
      
      visit outing_path(@kayak)
      expect(page).to have_content(@karl.name) 
    end
  end
end