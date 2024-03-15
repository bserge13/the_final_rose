require 'rails_helper'

RSpec.describe 'Bachelorette Show and Index page' do 
  before :each do 
    @bach = Bachelorette.create!(name: 'Hannah Brown', season_number: 15, season_description: 'The Most Dramatic Season Yet!')

    @loki = Contestant.create!(name: 'Loki', age: 28, hometown: 'Evansville, IN', bachelorette_id: @bach.id)
    @karl = Contestant.create!(name: 'Karl', age: 21, hometown: 'Evansville, IN', bachelorette_id: @bach.id)
    @nova = Contestant.create!(name: 'Nova', age: 32, hometown: 'Henderson, KY', bachelorette_id: @bach.id)
  end

  describe 'Bachelorette Contestants index' do 
    it 'has a bachelorettes contestants index page' do 
      visit bachelorette_contestants_path(@bach)
      expect(page).to have_content("Season #{@bach.season_number} Contestants")

      expect(page).to have_link(@loki.name)
      expect(page).to have_content("Age: #{@loki.age}")
      expect(page).to have_content("Hometown: #{@loki.hometown}")

      expect(page).to have_link(@karl.name)
      expect(page).to have_content("Age: #{@karl.age}")
      expect(page).to have_content("Hometown: #{@karl.hometown}")

      expect(page).to have_link(@nova.name)
      expect(page).to have_content("Age: #{@nova.age}")
      expect(page).to have_content("Hometown: #{@nova.hometown}")

      click_link(@karl.name)
      expect(current_path).to eq(contestant_path(@karl))
    end
  end
end
