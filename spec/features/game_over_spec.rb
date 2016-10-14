require 'spec_helper'


feature 'Game over' do
  context 'When Player 1 reaches 0 hp first' do
    before do
      allow(Kernel).to receive(:rand).and_return(10)
      sign_in_and_play
      attack_and_confirm
    end

    scenario 'Player 1 loses' do
      9.times { attack_and_confirm }
      click_button 'Attack'
      expect(page).to have_content 'Mittens loses!'
    end
  end
end
