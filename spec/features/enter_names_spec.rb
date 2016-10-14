require 'spec_helper'

feature 'enter names' do
    scenario 'submitting names' do
      sign_in_and_play
        expect(page).to have_content 'Dave vs. Mittens'
    end
    scenario 'sumbit player name to practice against computer' do
      sign_in_and_practise
      expect(page).to have_content 'Dave vs. Computer'
    end
end
